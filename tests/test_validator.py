import importlib.util
from pathlib import Path
import shutil
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "skill_validator", ROOT / "scripts" / "validate_skill.py"
)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class SkillValidatorTests(unittest.TestCase):
    def test_repository_is_valid(self):
        self.assertEqual(module.validate_repo(ROOT), [])

    def test_frontmatter_requires_exact_name(self):
        sample = "---\nname: outra-skill\ndescription: Teste\n---\n# Corpo"
        errors = module.validate_frontmatter(sample)
        self.assertTrue(any("name deve ser" in err for err in errors))

    def test_frontmatter_requires_description(self):
        sample = "---\nname: levantamento-requisitos-produto\n---\n# Corpo"
        errors = module.validate_frontmatter(sample)
        self.assertTrue(any("description" in err for err in errors))

    def test_missing_reference_is_detected(self):
        with tempfile.TemporaryDirectory() as d:
            target = Path(d)
            shutil.copytree(ROOT, target, dirs_exist_ok=True)
            (target / "references" / "banco-de-perguntas.md").unlink()
            errors = module.validate_repo(target)
            self.assertTrue(any("banco-de-perguntas" in err for err in errors))


if __name__ == "__main__":
    unittest.main()
