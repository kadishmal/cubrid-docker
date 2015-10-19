# To build a new image, run the following:
# docker build -t="lighthopper/cubrid:9.2.3.0005" .

FROM centos:6.6

# The same environment variables exported by
# /etc/profile.d/cubrid.
ENV CUBRID_USER=cubrid
ENV CUBRID=/opt/$CUBRID_USER
ENV CUBRID_DATABASES=$CUBRID/databases
ENV CUBRID_CHARSET=en_US
ENV LD_LIBRARY_PATH=$CUBRID/lib
ENV PATH=$CUBRID/bin:$PATH

RUN rpm -ivh http://ftp.cubrid.org/CUBRID_Engine/9.2.3/Linux/cubrid-9.2.3.0005-el5.x86_64.rpm

USER $CUBRID_USER

EXPOSE 33000 30000 8001 8002 1523

# `tail -f /dev/null` trick is to keep the foreground process always ON.
# Otherwise, the `cubrid` command quits as soon as it successfully
# starts up all the necessary services.
ENTRYPOINT cubrid service start && tail -f /dev/null
