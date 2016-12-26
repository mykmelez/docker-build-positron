FROM ubuntu:xenial

RUN apt-get update -y && \
    apt-get install -y \
      curl \
      git \
      nodejs \
      nodejs-legacy \
      npm \
      python \
      wget

RUN npm install -g taskcluster-vcs

# This gets the master version of bootstrap.py, but presumably the dependencies
# can change by branch.  Should we install dependencies at container run time
# rather than image build time?
RUN wget -O bootstrap.py https://raw.githubusercontent.com/mozilla/positron/master/python/mozboot/bin/bootstrap.py && python bootstrap.py --no-interactive --application-choice=browser

# bootstrap.py adds $HOME/.cargo/bin to the path in ~/.profile, but that file
# doesn't appear to get sourced when you `docker run -it [image] /bin/bash`,
# so we add it to the path explicitly here.
ENV PATH /root/.cargo/bin:$PATH

# Hopefully this'll enable us to remove the requirement to set SHELL at runtime
# before running `./mach build`.
ENV SHELL /bin/bash
