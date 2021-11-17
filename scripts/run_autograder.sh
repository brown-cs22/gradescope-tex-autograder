# Makes TeX Log script executable
export LC_ALL=C
chmod +x /autograder/source/texloganalyser

# Runs autograder
cp /autograder/source/compile_and_grade.py /autograder/submission/compile_and_grade.py
cd /autograder/submission
python3 compile_and_grade.py