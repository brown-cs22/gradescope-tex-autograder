# Zips and creates the autograder file to upload to Gradescope. 
find . -name '.DS_Store' -type f -delete
zip -r autograder.zip .