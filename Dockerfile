FROM centos:6.6

# The same environment variables exported by
# /etc/profile.d/cubrid.
ENV CUBRID_USER=cubrid
ENV CUBRID=/opt/$CUBRID_USER
ENV CUBRID_DATABASES=$CUBRID/databases
ENV CUBRID_LOGS=$CUBRID/log
ENV CUBRID_CHARSET=en_US
ENV CUBRID_VERSION=9.1.0
ENV CUBRID_PATCH_NUMBER=0218
ENV LD_LIBRARY_PATH=$CUBRID/lib
ENV PATH=$CUBRID/bin:$PATH

RUN rpm -ivh http://ftp.cubrid.org/CUBRID_Engine/$CUBRID_VERSION/Linux/cubrid-$CUBRID_VERSION.$CUBRID_PATCH_NUMBER-el5.x86_64.rpm

# Switch to `cubrid` user.
USER $CUBRID_USER

# Switch to `cubrid` home directory.
WORKDIR $CUBRID

# Add a script to create and start "demodb" database.
ADD create-start-demodb.sh $CUBRID

EXPOSE 33000 30000 8001 8002 1523

# CUBRID 9.1.0 comes with Web Manager enabled which fails to
# start up because it requires "root" user, but CUBRID requires
# "cubrid" user. Conflicting. So disabled Web Manager in
# CUBRID Manager configuration file.
RUN sed -i 's/support_web_manager=YES/support_web_manager=NO/' conf/cm.conf

# `tail -f /dev/null` trick is to keep the foreground process always ON.
# Otherwise, the `cubrid` command quits as soon as it successfully
# starts up all the necessary services.
CMD cubrid service start && tail -f $CUBRID_LOGS/**/* $CUBRID_LOGS/**/**/*
