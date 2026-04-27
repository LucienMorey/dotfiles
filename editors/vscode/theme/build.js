// build.js
// Merges src/theme-base.json + src/grammars/*.json into dist/lp-custom-cpp.json
// Grammar files are loaded in the order defined in GRAMMAR_ORDER — generic rules
// must come first so that language-specific rules can override them where needed.

const fs = require("fs");
const path = require("path");

const GRAMMAR_ORDER = [
  "generic.json"
];

const GRAMMAR_DIR = path.join(__dirname, "src", "grammars");
const BASE_PATH = path.join(__dirname, "src", "theme-base.json");
const OUT_PATH = path.join(__dirname, "dist", "lp-custom.json");

function loadJson(filePath) {
  const raw = fs.readFileSync(filePath, "utf8");
  // Strip single-line comments that are NOT inside strings, so files can include // notes.
  // Matches either a quoted string (captured) or a // comment (discarded).
  const stripped = raw.replace(/("(?:[^"\\]|\\.)*")|\/\/[^\n]*/g, (_, str) => str ?? "");
  try {
    return JSON.parse(stripped);
  } catch (err) {
    console.error(`Failed to parse ${filePath}:\n  ${err.message}`);
    process.exit(1);
  }
}

const base = loadJson(BASE_PATH);

const tokenColors = GRAMMAR_ORDER.flatMap((filename) => {
  const filePath = path.join(GRAMMAR_DIR, filename);
  if (!fs.existsSync(filePath)) {
    console.warn(`Warning: grammar file not found, skipping: ${filename}`);
    return [];
  }
  const parsed = loadJson(filePath);
  // Accept either a bare array or an envelope object with a tokenColors key,
  // the latter allows grammar files to carry a $schema for VSCode colour swatches.
  const rules = Array.isArray(parsed) ? parsed : parsed.tokenColors;
  if (!Array.isArray(rules)) {
    console.error(`Error: ${filename} must be a JSON array or an object with a tokenColors array`);
    process.exit(1);
  }
  console.log(`  ${filename}: ${rules.length} rules`);
  return rules;
});

const theme = { ...base, tokenColors };

fs.mkdirSync(path.dirname(OUT_PATH), { recursive: true });
fs.writeFileSync(OUT_PATH, JSON.stringify(theme, null, 2), "utf8");

console.log(`\nBuilt ${tokenColors.length} total token rules → ${OUT_PATH}`);