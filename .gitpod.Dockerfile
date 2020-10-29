FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
WORKDIR /workspace
RUN ["curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz"]
RUN ["gunzip elm.gz"]
RUN ["chmod +x elm"]
RUN ["sudo mv elm /usr/local/bin"]