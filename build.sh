PROJECT_FILE="${1:-default.project.json}"

echo "Building place file using $PROJECT_FILE"
echo "-----------------------------------------"

if [ ! -f "$(pwd)/build/place.rbxl.lock" ]; then
    rm -rf "$(pwd)/build"
    mkdir "$(pwd)/build"
    rojo build "$PROJECT_FILE" -o "$(pwd)/build/place.rbxl"
    start "" "$(pwd)/build/place.rbxl"
    rojo serve "$PROJECT_FILE"
else
    echo "Roblox place file is already open, close it first and re-run!"
fi
