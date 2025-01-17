# Sets up the Gradescope Autograder environment
# Installs TeXLive and Python3

apt update

cd /autograder
apt install -y texlive-full python3 python3-pip
pip3 install bs4 requests-toolbelt pypdf
