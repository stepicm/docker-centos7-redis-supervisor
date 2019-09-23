FROM centos:7
MAINTAINER Martin Stepic <grft801@airmail.cc>

RUN yum -y --setopt=tsflags=nodocs update
RUN yum -y --setopt=tsflags=nodocs --nogpgcheck install epel-release
RUN yum -y --setopt=tsflags=nodocs --nogpgcheck install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y --setopt=tsflags=nodocs --nogpgcheck install supervisor redis40u
RUN yum clean all

RUN rm /etc/supervisord.conf
ADD supervisor.conf /etc/supervisord.conf

RUN rm /etc/redis.conf
ADD redis.conf /etc/redis.conf

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]

EXPOSE 6379 9111