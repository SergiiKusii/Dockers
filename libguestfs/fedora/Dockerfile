# start from base fedora
FROM fedora:28
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

# REQUIREMENTS
RUN dnf -yqq update
RUN dnf -yqq install 'dnf-command(builddep)'
RUN dnf -yqq install libtool m4 automake
RUN dnf -yqq  builddep libguestfs 
RUN dnf -yqq builddep libldm libcap libvirt libselinux fuse gdisk acl
RUN dnf -yqq install make
RUN dnf -yqq install texinfo
RUN dnf -yqq install autoconf automake bc gettext git gperf gzip perl rsync tar  

#BUILDING FROM GIT
#COPY ./install_libquestfs_fedora.sh /app/install_libquestfs_fedora.sh
#RUN chmod +x /app/install_libquestfs_fedora.sh 
#CMD /app/install_libquestfs_fedora.sh
