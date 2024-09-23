PROJECT_FILE="${1:-default.project.json}"

result=${PWD##*/}
result=${result:-/}
pluginName="$result-plugin.rbxm"

rojo build --plugin $pluginName --watch "$PROJECT_FILE"
echo "-----------------------------------------"
echo "Watching for file changes $PROJECT_FILE"

