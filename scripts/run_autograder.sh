# Makes TeX Log script executable
export LC_ALL=C
chmod +x /autograder/source/scripts/texloganalyser

# Runs autograder
cp /autograder/source/scripts/compile_and_grade.py /autograder/submission/compile_and_grade.py
cp /autograder/source/templates/cs22.cls /autograder/submission/cs22.cls
cp /autograder/source/templates/cs22ta.cls /autograder/submission/cs22ta.cls
cd /autograder/submission
python3 compile_and_grade.py
