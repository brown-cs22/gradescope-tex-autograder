import sys
import os
import json

SUBMISSION = "/autograder/submission/"
RESULT = "/autograder/results/result.json"
OUTPUT = "/autograder/results/output.txt"
LOG_ANALYSIS_OUTPUT = "/autograder/results/log_analysis_output.txt"

def write_result(output, dropdown_results=[]):
    result = {}
    result["output"] = output
    result["dropdown_results"] = dropdown_results
    with open(RESULT, "w") as f:
        f.write(json.dumps(result))

def get_filename():
    """
    Gets the filename of the `.tex` file to compile. 
    """
    _, _, files = next(os.walk(SUBMISSION, (None, None, [])))
    tex_files = []
    for file in files:
        if file.endswith(".tex"):
            tex_files.extend(file)
    if len(files) != 1:
        write_result("Error compiling: There should be only one `.tex` file in the submission.")
        sys.exit(1)
    filename = files[0]
    return files[0]

def compile_file(filename):
    """
    Compiles the file and returns the output.
    """
    command = "pdflatex -shell-escape -interaction=nonstopmode -halt-on-error " + filename + " > " + OUTPUT
    os.system(command)

def grade(filename):
    """
    Grades the submission.
    """
    output_file = open(OUTPUT, "r")
    output = output_file.read()
    if "Fatal error occurred, no output PDF file produced!" in output:
        write_result("Error compiling: There was a fatal error while compiling the submission and no PDF file was produced.")
        sys.exit(1)
    log_file = filename.replace(".tex", ".log")
    log_file_text = open(log_file, "r").read()
    os.system("/autograder/source/texloganalyser -a -w " + log_file + " > " + LOG_ANALYSIS_OUTPUT)
    log_analysis_output = open(LOG_ANALYSIS_OUTPUT, "r").read()
    warning_test = {"max_score": 2, "name": "Warnings/Bad Boxes", "output": log_analysis_output, "score": 0, "visibility": "visible"}
    if "0 warnings" in log_analysis_output:
        warning_test["score"] += 1
    if "0 bad boxes" in log_analysis_output:
        warning_test["score"] += 1
    log_test = {"name": "LaTeX Output Log", "output": log_file_text, "visibility": "visible"}
    write_result("File compiled successfully! ", [warning_test, log_test])

def main():
    file_to_compile = SUBMISSION + get_filename()
    compile_file(file_to_compile)
    grade(file_to_compile)

if __name__ == "__main__":
    main()
