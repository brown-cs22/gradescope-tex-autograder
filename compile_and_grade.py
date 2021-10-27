import sys
import os
import json

SUBMISSION = "/autograder/submission/"
SOURCE = "/autograder/source/"
RESULT = "/autograder/results/results.json"
OUTPUT = "/autograder/results/output.txt"
LOG_ANALYSIS_OUTPUT = "/autograder/results/log_analysis_output.txt"

def write_result(output, dropdown_results=[]):
    result = {}
    result["output"] = output
    result["tests"] = dropdown_results
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
            tex_files.append(file)
    if len(tex_files) != 1:
        write_result("Error compiling: There should be only one .tex file in the submission.")
        sys.exit(1)
    filename = files[0]
    return files[0]

def compile_file(filename):
    """
    Compiles the file and returns the output.
    """
    command = "pdflatex -shell-escape -interaction=nonstopmode -halt-on-error " + SUBMISSION + filename + " > " + OUTPUT
    os.system(command)
    os.system(command)

def grade(filename):
    """
    Grades the submission.
    """
    output_file = open(OUTPUT, "r")
    output = output_file.read()
    log_file = SUBMISSION + filename.replace(".tex", ".log")
    log_file_text = open(log_file, "r").read()
    log_test = {"name": "LaTeX Output Log", "output": log_file_text, "visibility": "hidden"}
    if "Fatal error occurred, no output PDF file produced!" in output:
        log_test["visibility"] = "visible"
        log_test["score"] = 0
        log_test["max_score"] = 2
        write_result("Error compiling: There was a fatal error while compiling the submission and no PDF file was produced. Please check your .tex file and try again. The log file is shown below. ", [log_test])
        sys.exit(1)
    os.system("/autograder/source/texloganalyser --last -a -w -t -i " + log_file + " > " + LOG_ANALYSIS_OUTPUT)
    log_analysis_output = open(LOG_ANALYSIS_OUTPUT, "r").read()
    warning_test = {"max_score": 1, "name": "Compilation", "output": log_analysis_output, "score": 0, "visibility": "visible"}
    if "0 warnings" in log_analysis_output:
        warning_test["score"] += 0.5
    if "0 bad boxes" in log_analysis_output:
        warning_test["score"] += 0.5
    write_result("It appears that your file compiled successfully! You'll see any warnings or bad boxes produced below, along with a generated score. Please still verify that your submitted PDF is correct and correctly tagged. ", [warning_test, log_test])

def main():
    file_to_compile = get_filename()
    compile_file(file_to_compile)
    grade(file_to_compile)

if __name__ == "__main__":
    main()
