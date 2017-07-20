FROM centos:6
RUN yum -y update && yum -y install \
    bzip2 \
    cppunit-devel \
    expat-devel \
    gcc \
    gcc-c++ \
    gdb \
    gettext \
    git \
    glibc-devel \
    glibc-devel.i686 \
    libcurl-devel \
    libgcc.i686 \
    libstdc++-devel \
    make \
    nano \
    openssl-devel \
    perl-ExtUtils-MakeMaker \
    tcl \
    wget \
    zlib.i686 \
    zlib-devel


# Install git
COPY ./prebuilt/git-2.13.3.tar.gz /tmp/
RUN tar -C /tmp -xzf /tmp/git-2.13.3.tar.gz
WORKDIR /tmp/git-2.13.3
RUN make prefix=/opt/git-2.13.3 all
RUN make prefix=/opt/git-2.13.3 install
ENV PATH /opt/git-2.13.3/bin:$PATH


# Disable real-time throttling
RUN echo '' >> /root/.bashrc
RUN echo '# Disable real-time throttling' >> /root/.bashrc
RUN echo 'sysctl -w kernel.sched_rt_runtime_us=-1' >> /root/.bashrc


WORKDIR /home/shared

