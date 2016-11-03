FROM ubuntu:latest
MAINTAINER Simon Schauß <sschauss@uni-koblenz.de>
RUN apt-get update
RUN apt-get install -y build-essential autoconf libgsl0-dev libffi-dev subversion ikarus
RUN useradd -ms /bin/bash church
RUN ln -s /usr/lib/x86_64-linux-gnu/ikarus /usr/lib/x86_64-linux-gnu/ikarus/ikarus
USER church
WORKDIR /home/church
RUN svn checkout --password anonymous --username anonymous --trust-server-cert --non-interactive  https://svn.csail.mit.edu/mit-church/trunk mit-church
RUN echo export IKARUS_LIBRARY_PATH=~/mit-church:$IKARUS_LIBRARY_PATH >> ~/.bashrc
WORKDIR /home/church/mit-church
ADD fix_gsl_paths.diff /home/church
RUN patch -p0 -i /home/church/fix_gsl_paths.diff
RUN ikarus tests/church-test-suite.ss
