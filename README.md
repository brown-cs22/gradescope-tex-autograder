# Gradescope TeX Autograder

## Motivation

Many courses use Gradescope. Some math-related/adjacent courses might require that students TeX up assignment submissions and submit a PDF to Gradescope. 

From personal experience (in courses I've staffed), it's also been good practice to request the `.tex` files from students - just in case anything goes awry (eg: a submission has a paragraph accidentally in math mode, causing the explanation to be unreadable/ungradable). Some courses might also opt to use submitted `.tex` files to check for plagiarism. 

This is a tool to enhance Gradescope `.tex` drops. Gradescope will attempt to compile the `.tex` document and prompt students if there were any errors or warnings during compilation (ie: a `Missing $ inserted`). This encourages students to write _good_ LaTeX (without any compilation errors or warnings), instead of just functioning LaTeX. This optionally allows courses to _reward_ students (like through extra credit) for having clean, error-free `.tex` files. 

## Usage

Run
```
bash create_zip.sh
```
from the directory to create a zip of the autograder to upload to Gradescope. From there - it should be able to detect `.tex` files and compile for each submission, returning an output. 
