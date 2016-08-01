FROM foodresearch/bppc
MAINTAINER Mark Fernandes <mark.fernandes@ifr.ac.uk>
#
# Docker environment for Ethan Cermi's Samtools primer course
#
USER root 
ENV   SIAB_USER=guest \
  SIAB_GROUP=guest \
  SIAB_PASSWORD=ngsintro \
  SIAB_HOME=/home/$SIAB_USER 
ENV COURSEDIR=/home/guest
# VOLUME $COURSEDIR

RUN apt-get update && apt-get install -y samtools bowtie2 git 
# zlib-devel
# WORKDIR /home/guest
#RUN mkdir $SIAB_HOME/bcftools  $SIAB_HOME/samtools_primer && pwd && ls -alFs $SIAB_HOME

#RUN git clone --branch=develop git://github.com/samtools/bcftools.git $SIAB_HOME/Sbcftools
RUN cd /home/guest && git clone https://github.com/samtools/bcftools.git ./ &&  git clone https://github.com/ecerami/samtools_primer.git ./ 
# RUN cd bcftools-develop && make && mv bcftool /usr/bin/bcftool
#RUN git clone git://github.com/ecerami/samtools_primer.git $SIAB_HOME/samtools_primer
RUN ls -alFsR $COURSEDIR
# RUN ls $SIAB_HOME/bcftools && ls $SIAB_HOME/samtools_primer
# RUN ls $COURSEDIR/bcftools && ls $COURSEDIR/samtools_primer

# Hopefully that's all pre-requisites in place
# RUN chown -R guest.guest $COURSEDIR

ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
