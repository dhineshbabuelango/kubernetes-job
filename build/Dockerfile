FROM centos:latest
ADD . /
RUN chmod -R 775 /Scripts
ENTRYPOINT [ "/Scripts/bin/filecopy.sh" ]