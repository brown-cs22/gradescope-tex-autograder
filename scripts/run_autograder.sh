# Makes TeX Log script executable
export LC_ALL=C
chmod +x /autograder/source/scripts/texloganalyser

# Runs autograder
cp /autograder/source/scripts/compile_and_grade.py /autograder/submission/compile_and_grade.py
cp /autograder/source/templates/compile/* /autograder/submission
cd /autograder/submission
python3 compile_and_grade.py
