This is a [Docker](https://www.docker.com/) image to build [Positron](https://github.com/mozilla/positron) in continuous integration via the [TaskCluster](https://docs.taskcluster.net/) continuous integration service.

It starts with Ubuntu 14.04 (Trusty), adds build prerequisites (as determined by Mozilla's bootstrap.py script), and includes [taskcluster-vcs](https://www.npmjs.com/package/taskcluster-vcs) (which uses a cache of [gecko-dev](https://github.com/mozilla/gecko-dev) to reduce the load on GitHub when fetching changes).

The Positron repo triggers TaskCluster builds via [.taskcluster.yml](https://github.com/mozilla/positron/blob/master/.taskcluster.yml). TaskCluster is only available to repositories in the ["mozilla" organization on GitHub](https://github.com/mozilla/). But if you have Docker installed locally, then you can use this image to build Positron (and other Mozilla apps with similar prerequisites) locally via something like:

```bash
docker pull mykmelez/docker-build-positron
docker run -it mykmelez/docker-build-positron /bin/bash
git clone https://github.com/mozilla/positron
cd positron
./mach build
```
