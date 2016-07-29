FROM foodresearch/bppc
MAINTAINER Mark Fernandes <mark.fernandes@ifr.ac.uk>
#
# Docker environment for Ethan Cermi's Samtools primer course
#

RUN apt-get update && apt-get install -y samtools bowtie2 git 
# zlib-devel
RUN MKDIR $SIAB_HOME/bcftools && MKDIR $SIAB_HOME/samtools_primer
RUN cd $SIAB_HOME/bcftools   && git clone --branch=develop git://github.com/samtools/bcftools.git ./
# RUN cd bcftools-develop && make && mv bcftool /usr/bin/bcftool
 RUN cd $SIAB_HOME/samtools_primer  && git clone git://github.com/ecerami/samtools_primer.git ./

# Hopefully that's all pre-requisites in place
VOLUME $SIAB_HOME
ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
