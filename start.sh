#!/bin/bash

echo "Starting PM Exam Web Application..."
echo "Python version: $(python --version)"
echo "Current directory: $(pwd)"
echo "Files in directory:"
ls -la

# Check if required files exist
if [ ! -f "app.py" ]; then
    echo "Error: app.py not found"
    exit 1
fi

if [ ! -f "additional_questions.py" ]; then
    echo "Warning: additional_questions.py not found"
fi

if [ ! -f "additional_questions_2.py" ]; then
    echo "Warning: additional_questions_2.py not found"
fi

# Test import
echo "Testing Python imports..."
python -c "
try:
    import app
    print('✅ app.py import successful')
except Exception as e:
    print(f'❌ app.py import failed: {e}')
    exit(1)
"

# Start the application
echo "Starting gunicorn..."
exec gunicorn --config gunicorn.conf.py app:app