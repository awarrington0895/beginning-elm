FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
RUN sudo apt-get update && sudo apt-get install -y curl
WORKDIR /workspace
RUN sudo curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
    && sudo gunzip elm.gz \
    && sudo chmod +x elm \
    && sudo mv elm /usr/local/bin