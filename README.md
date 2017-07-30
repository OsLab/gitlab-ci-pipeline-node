Gitlab CI pipeline for Node applications
========================
> Docker image with everything you'll need to build and test JS applications on Gitlab Continous Integration

![Docker Pulls](https://img.shields.io/docker/pulls/dockernodejs/gitlab-ci-pipeline.svg)
[![Build Status](https://travis-ci.org/node-docker/gitlab-ci-pipeline.svg?branch=master)](https://travis-ci.org/node-docker/gitlab-ci-pipeline)

# Supported tags
| Tag | Image | Layers |
| --- | --- |  --- |
| ```6.11```| ```dockernodejs/gitlab-ci-pipeline:7.1``` | [![](https://images.microbadger.com/badges/image/dockernodejs/gitlab-ci-pipeline:6.11.svg)](https://microbadger.com/images/dockernodejs/gitlab-ci-pipeline:6.11)| 
| ```7.10```| ```dockernodejs/gitlab-ci-pipeline:7.0``` | [![](https://images.microbadger.com/badges/image/dockernodejs/gitlab-ci-pipeline:7.10.svg)](https://microbadger.com/images/dockernodejs/gitlab-ci-pipeline:7.10)|
| ```8.2```| ```dockernodejs/gitlab-ci-pipeline:5.6``` | [![](https://images.microbadger.com/badges/image/dockernodejs/gitlab-ci-pipeline:8.2.svg)](https://microbadger.com/images/dockernodejs/gitlab-ci-pipeline:8.2)|

> Based on [Official Node images Alpine][docker_hub] and all versions come with:

* Dependency Manager:
    * [composer][composer]
* Automation of tasks:
    * [Apache Ant][apache_ant]
    * [Make][make]
* JS Quality Assurance:
    * [jshint][jshint]
    * [PhantomJS][phantom_js]
    * [Jasmine][jasmine]
    * [Protractor][protractor]
    * [QUnit][qunit]
    * [Nightwatch][nightwatch]
    * [JSpec][jspec]
    * [JSLitmus][js_litmus]
    * [CasperJS][casper_js]
    * [NemoJS][nemo_js]
    * [BusterJS][buster_js]
    * [Codecept][codecept]
    * [DalekJS][dalek_js]

## First of all you must have installed gitlab-ci-runner

* [Install Gitlab-ci-runner](./docs/1-install-gitlab-runner.md)
* [Register an runner](./docs/2-register-runner.md)

## Configuration of your jobs with .gitlab-ci.yml

### Basic configuration 

```yaml
image: dockernodejs/gitlab-ci-pipeline:8.2

cache:
  paths:
      - node_modules/

test:app:
    script:
        - npm install
        - find . -name "*.js" -print0 | xargs -0 jslint

```

### Using the `mariadb` service and Make

```yaml
variables:
    MYSQL_ROOT_PASSWORD: ci
    MYSQL_USER: ci
    MYSQL_PASSWORD: ci
    MYSQL_DATABASE: ci
    DB_HOST: mariadb

test:
  stage: test
  services:
    - mariadb:10.3
  image: dockernodejs/gitlab-ci-pipeline:8.2
  script:
    - make test 
```

### Multi versions and Apache-Ant

```yaml
cache:
    paths:
        - node_modules/

stages:
    - test

test:8.2:
    image: dockernodejs/gitlab-ci-pipeline:8.2
    script:
        - ant -Dbasedir=`pwd` -buildfile build/ci_gitlab.xml

test:7.10:
    image: dockernodejs/gitlab-ci-pipeline:7.10
    script:
        - ant -Dbasedir=`pwd` -buildfile build/ci_gitlab.xml
```

---

## License

This project is released under the MIT License, you agree to license your code under the [MIT license](LICENSE)

[docker_hub]: https://hub.docker.com/_/node/
[nodejs]: https://nodejs.org/en/
[yarn]: https://yarnpkg.com
[apache_ant]: http://ant.apache.org/
[make]: https://www.gnu.org/software/make/
[jshint]: http://jshint.com
[phantom_js]: http://phantomjs.org/
[jasmine]: https://jasmine.github.io/
[qunit]: https://qunitjs.com/
[protractor]: http://www.protractortest.org/
[js_litmus]: https://www.broofa.com/Tools/JSLitmus/
[nightwatch]: http://nightwatchjs.org/
[casper_js]: http://casperjs.org/
[nemo_js]: http://nemo.js.org/
[buster_js]: http://docs.busterjs.org
[codecept]: http://codecept.io/
[dalek_js]: http://dalekjs.com/
[jspec]: https://github.com/nodeontrain/jspec
