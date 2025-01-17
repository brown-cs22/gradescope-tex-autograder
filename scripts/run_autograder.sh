# Makes TeX Log script executable
export LC_ALL=C
chmod +x /autograder/source/scripts/texloganalyser

# Runs autograder
yes | cp -rf /autograder/source/scripts/compile_and_grade.py /autograder/submission/compile_and_grade.py
yes | cp -rf /autograder/source/scripts/config.py /autograder/submission/config.py
cp /autograder/source/templates/compile/* /autograder/submission
cd /autograder/submission
python3 compile_and_grade.py
