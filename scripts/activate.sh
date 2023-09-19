<<comment
# Help
# Objective of this exercise is to test setup environment ...
#     plus, start a Web Server
# The hash # is a comment or action ...
#     # is a comment symbol in a .sh file 
# The dollar $ represents a terminal command ... 
#     $ is not part of command

# Start a terminal for commands
$ mdkir vscode
$ cd vscode
$ git clone https://github.com/nighthawkcoders/student.git
$ ~/vscode/student/scripts/activate.sh

# Run the head command, leave this terminal open ...
#    the head command shows remaining instructions  ...
#    find this spot and continue on
$ head -30 ~/vscode/student/scripts/activate.sh

# Start a new terminal ...
#    the "new" terminal is the command terminal ...
#    the "original" terminal shows commands ...
#    type commands in "new" terminal
$ cd ~/vscode/student
$ bundle install
$ bundle exec jekyll serve

# End
# The build execution is complete ...
#     Ctl-Click on "link" in terminal ...
#     observe web site in the opened browser
comment

# Function to check if a line exists in run commands
line_exists_in_rc() {
  grep -Fxq "$1" ~/.bashrc
}

# Function to add line to run commands
add_to_rc() {
  if ! line_exists_in_rc "$1"; then
    echo "$1" >> ~/.bashrc
  fi
}

#### Github Pages Local Build support
echo "=== GitHub pages build tools  ==="
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
add_to_rc "# Ruby Gem Path"
add_to_rc 'export GEM_HOME="$HOME/gems"'
add_to_rc 'export PATH="$HOME/gems/bin:$PATH"'

echo "=== Gem install starting, thinking... ==="
gem install jekyll bundler

echo "=== !!!Start a new Terminal!!! ==="