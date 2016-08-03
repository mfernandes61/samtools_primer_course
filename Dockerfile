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
# NB /home and below are a VOLUME in bppc Dockerfile

COPY welcome.txt /etc/motd
RUN mkdir /tools /course_material
RUN apt-get update && apt-get install -y samtools bowtie2 git lighttpd
# zlib1g-dev

# instal htslib & bcftools from source (do for Samtools also?)
RUN cd /tools && git clone https://github.com/samtools/htslib.git  && git clone https://github.com/samtools/bcftools.git  
RUN git clone https://github.com/samtools/samtools.git
RUN mkdir /usr/local/bin/plugins
RUN cd /tools/htslib && make install
# RUN cd /tools/bcftools && make install
RUN cd /course_material && git clone https://github.com/ecerami/samtools_primer.git ./
RUN /etc/init.d/lighttpd -D start
EXPOSE 80

# Hopefully that's all pre-requisites in place
# RUN chown -R guest.guest $COURSEDIR

ENTRYPOINT ["/scripts/launchsiab.sh"]
CMD ["/bin/bash"]
