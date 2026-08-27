#!/bin/bash

# set -e

echo "Starting setup script..."

PROJECT_NAME="my_project"

echo "Creating project directory: $PROJECT_NAME"
mkdir -p "$PROJECT_NAME"

echo "Creating virtual environment..."
python3 -m venv "$PROJECT_NAME/venv"

echo "Activating virtual environment..."
source "$PROJECT_NAME/venv/bin/activate"

echo "Virtual environment activated."

echo "Upgrading pip..."
pip install --upgrade pip

# Making directories for the project
mkdir -p "$PROJECT_NAME/data"
mkdir -p "$PROJECT_NAME/scripts"
mkdir -p "$PROJECT_NAME/notebooks"
mkdir -p "$PROJECT_NAME/logs"
mkdir -p "$PROJECT_NAME/config"

# Creating project files
touch "$PROJECT_NAME/requirements.txt"
touch "$PROJECT_NAME/.env"

# .gitignore should exclude venv, cache files, and secrets
cat > "$PROJECT_NAME/.gitignore" << 'EOF'
venv/
__pycache__/
*.pyc
.env
logs/
.ipynb_checkpoints/
EOF

echo "Installing required packages from requirements.txt (if any)..."
if [ -s "$PROJECT_NAME/requirements.txt" ]; then
    pip install -r "$PROJECT_NAME/requirements.txt"
else
    echo "requirements.txt is empty, skipping package installation."
fi

# Enter project directory
cd "$PROJECT_NAME"

echo "Initializing git repository..."
git init

echo "Deactivating virtual environment..."
deactivate

echo "Project setup completed successfully!"