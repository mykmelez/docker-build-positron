FROM taskcluster/centos6-build-upd:0.1.6.20160329195300

RUN yum install --assumeyes centos-release-scl && yum install --assumeyes devtoolset-3-toolchain
