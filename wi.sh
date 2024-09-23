DEFAULT_PROJECT_FILE="default.project.json"
PROJECT_FILE="${1:-$DEFAULT_PROJECT_FILE}"

rm -rf "$(pwd)/Packages"
rm -rf "$(pwd)/ServerPackages"
rm -rf "$(pwd)/sourcemap.json"
rm -rf "$(pwd)/wally.lock"
wally install
rojo sourcemap "$PROJECT_FILE" >> sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages

if [ -d "ServerPackages" ]; then
    wally-package-types --sourcemap sourcemap.json ServerPackages
fi