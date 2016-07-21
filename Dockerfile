FROM ubuntu:xenial
RUN apt-get update -y && \
    apt-get install -y \
      git \
      python \
      wget

# This gets the master version of bootstrap.py, but presumably the dependencies
# can change by branch.  Should we install dependencies at container run time
# rather than image build time?
RUN wget -O bootstrap.py https://raw.githubusercontent.com/mozilla/positron/master/python/mozboot/bin/bootstrap.py && python bootstrap.py --no-interactive --application-choice=browser
