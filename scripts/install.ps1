param(
    [ValidateSet('codex', 'claude', 'both')][string]$Target = 'both',
    [ValidateSet('copy', 'symlink')][string]$Mode = 'copy'
)

$ErrorActionPreference = 'Stop'
$SkillName = 'levantamento-requisitos-produto'
$SourceDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if (-not (Test-Path (Join-Path $SourceDir 'SKILL.md')) -or
    -not (Test-Path (Join-Path $SourceDir 'references'))) {
    throw 'Origem inválida: SKILL.md e references/ são obrigatórios.'
}

function Install-Skill([string]$BaseDir) {
    New-Item -Path $BaseDir -ItemType Directory -Force | Out-Null
    $dest = Join-Path $BaseDir $SkillName
    if ([IO.Path]::GetFullPath($dest).TrimEnd('\') -eq
        [IO.Path]::GetFullPath($SourceDir).TrimEnd('\')) {
        Write-Host "Origem já está no destino: $dest"
        return
    }

    if (Test-Path -LiteralPath $dest) {
        $item = Get-Item -LiteralPath $dest -Force
        if ($Mode -eq 'symlink' -and $item.LinkType -eq 'SymbolicLink' -and
            $item.Target -eq $SourceDir) {
            Write-Host "Symlink já correto: $dest"
            return
        }
    }

    if (Test-Path -LiteralPath $dest -PathType Any) {
        $backup = "$dest.backup-$(Get-Date -Format yyyyMMdd-HHmmss)-$PID"
        Move-Item -LiteralPath $dest -Destination $backup
        Write-Host "Backup preservado: $backup"
    }

    if ($Mode -eq 'symlink') {
        New-Item -ItemType SymbolicLink -Path $dest -Target $SourceDir | Out-Null
        Write-Host "Symlink: $dest -> $SourceDir"
    } else {
        New-Item -Path $dest -ItemType Directory -Force | Out-Null
        Copy-Item -LiteralPath (Join-Path $SourceDir 'SKILL.md') -Destination $dest
        Copy-Item -LiteralPath (Join-Path $SourceDir 'references') -Destination $dest -Recurse
        if (Test-Path (Join-Path $SourceDir 'examples')) {
            Copy-Item -LiteralPath (Join-Path $SourceDir 'examples') -Destination $dest -Recurse
        }
        Write-Host "Cópia: $dest"
    }
}

if ($Target -in @('codex', 'both')) {
    Install-Skill (Join-Path $HOME '.agents\skills')
}
if ($Target -in @('claude', 'both')) {
    Install-Skill (Join-Path $HOME '.claude\skills')
}
Write-Host 'Concluído.'
