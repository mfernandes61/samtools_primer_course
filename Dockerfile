FROM umfernandes61/BPPC
MAINTAINER Mark Fernandes <mark.fernandes@ifr.ac.uk>
#
# Docker environment for Ethan Cermi's Samtools primer course
#

RUN apt-get update && apt-get install -y samtools bowtie2 git zlib-devel
RUN git clone --branch-develop git//github/samtools/bcftools.git
RUN cd bcftools && make && mv bcftool /usr/bin/bcftool
RUN cd $SIAB_HOME && git https://github.com/ecerami/samtools_primer.git

# Hopefully that's all pre-requisites in place
VOLUME $SIAB_HOME
ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
