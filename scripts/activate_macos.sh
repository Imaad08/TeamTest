<<comment
# Help
# Objective of this exercise is to test setup environment ...
#     plus, start a Web Server
# The hash # is a comment or action ...
#     # is a comment symbol in a .sh file 
# The dollar $ represent a terminal command ... 
#     $ is not part of command

# Start a terminal for commands
$ mdkir vscode
$ cd vscode
$ git clone https://github.com/nighthawkcoders/teacher.git
$ ~/vscode/teacher/scripts/activate_macos.sh

# Run the head command, leave this terminal open ...
#    the head command shows remaining instructions  ...
#    find this spot and continue on
$ head -32 ~/vscode/teacher/scripts/activate_macos.sh

# Start a new terminal ...
#    the "new" terminal is the command terminal ...
#    the "original" terminal shows commands ...
#    type commands in "new" terminal
$ cd ~/vscode/teacher
$ bundle install
$ bundle exec jekyll serve

# End
# The build execution is complete ...
#     Ctl-Click on "link" in terminal ...
#     observe web site in the opened browser
comment

#### Setup CompSci / GitHub Pages Tool Requirements
~/vscode/student/scripts/setup_macos.sh
#### Show instructions
head -32 ~/vscode/teacher/scripts/activate_macos.sh
echo "=== !!!Start a new Terminal!!! ==="