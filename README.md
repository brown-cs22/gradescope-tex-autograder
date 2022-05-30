# Autograder

Compiles student `.tex` submissions. 

## Usage

Run
```
bash create_zip.sh
```
from the directory to create a zip of the autograder to upload to Gradescope. From there - it should be able to detect `.tex` files and compile for each submission, returning an output. 

Any template files that you want to be included in the build directory can be added to the `templates` folder. This includes course and homework template `.cls` and `.sty` files. 
