## Install the GitLab Runner

[Docker][docker] is required, referer to the official documentation for installation.

First, verify that Docker is installed with:

```
$ docker info
```

GitLab provides a repository where you can easily install and update GitLab Runner. The supported distros as Debian, Ubuntu and CentOS. Let's install the repository with this one-line:

```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash
```

Now let's install GitLab Runner:

```
apt install gitlab-ci-multi-runner
```

And verify it's installed:

```
gitlab-runner --version
```

Excellent! We're now ready to start using it.

[Next - Register an runner](2-register-runner.md)

[docker]: https://www.docker.com
