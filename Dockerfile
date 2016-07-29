FROM umfernandes61/BPPC
MAINTAINER Mark Fernandes <mark.fernandes@ifr.ac.uk>
#
# Docker environment for Ethan Cermi's Samtools primer course
#

RUN apt-get update && apt-get install -y samtools bowtie2 git zlib-devel
RUN git clone --branch-develop git//github/samtools/bcftools.git
RUN cd bcftools && make && mv bcftool /usr/bin/bcftool
