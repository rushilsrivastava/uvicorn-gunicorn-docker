[![Test](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/workflows/Test/badge.svg)](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/actions?query=workflow%3ATest) [![Deploy](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/workflows/Deploy/badge.svg)](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/actions?query=workflow%3ADeploy)

# uvicorn-gunicorn

[**Docker**](https://www.docker.com/) image with [**Uvicorn**](https://www.uvicorn.org/) managed by [**Gunicorn**](https://gunicorn.org/) for high-performance web applications in **[Python](https://www.python.org/) 3.6 and above** with performance auto-tuning. Optionally in a slim version or based on Alpine Linux. This is a slightly opinionated fork from [tiangolo/uvicorn-gunicorn-docker](https://github.com/tiangolo/uvicorn-gunicorn-docker).

**GitHub repo**: [https://github.com/rushilsrivastava/uvicorn-gunicorn-docker](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker)

**Docker Hub image**: [https://hub.docker.com/r/rushilsrivastava/uvicorn-gunicorn/](https://hub.docker.com/r/rushilsrivastava/uvicorn-gunicorn/)


## Supported tags and respective `Dockerfile` links

* [`python3.9`, `latest` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.9.dockerfile)
* [`python3.9-alpine3.13` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.9-alpine3.13.dockerfile)
* [`python3.9-slim` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.9-slim.dockerfile)
* [`python3.8` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.8.dockerfile)
* [`python3.8-alpine3.10` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.8-alpine3.10.dockerfile)
* [`python3.7` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.7.dockerfile)
* [`python3.7-alpine3.8` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.7-alpine3.8.dockerfile)
* [`python3.6` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.6.dockerfile)
* [`python3.6-alpine3.8` _(Dockerfile)_](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/python3.6-alpine3.8.dockerfile)

**Note**: There are [tags for each build date](https://hub.docker.com/r/rushilsrivastava/uvicorn-gunicorn/tags). If you need to "pin" the Docker image version you use, you can select one of those tags. E.g. `rushilsrivastava/uvicorn-gunicorn:python3.7-2019-10-15`.

## Description

Python web applications running with **Uvicorn** (using the "ASGI" specification for Python asynchronous web applications) have shown to have [some of the best performances, as measured by third-party benchmarks](https://www.techempower.com/benchmarks/#section=test&runid=a979de55-980d-4721-a46f-77298b3f3923&hw=ph&test=fortune&l=zijzen-7).

The achievable performance is on par with (and in many cases superior to) **Go** and **Node.js** frameworks.

This image has an "auto-tuning" mechanism included, so that you can just add your code and get that same **high performance** automatically. And without making sacrifices.

## Technical Details

### Uvicorn

**Uvicorn** is a lightning-fast "ASGI" server.

It runs asynchronous Python web code in a single process.

### Gunicorn

You can use **Gunicorn** to manage Uvicorn and run multiple of these concurrent processes.

That way, you get the best of concurrency and parallelism.

### `rushilsrivastava/uvicorn-gunicorn`

This image will set a sensible configuration based on the server it is running on (the amount of CPU cores available) without making sacrifices.

It has sensible defaults, but you can configure it with environment variables or override the configuration files.

There is also a slim version and another one based on Alpine Linux. If you want one of those, use one of the tags from above.

### Frameworks

This image was created to be the base image for:

* [**tiangolo/uvicorn-gunicorn-starlette**](https://github.com/tiangolo/uvicorn-gunicorn-starlette-docker)
* [**tiangolo/uvicorn-gunicorn-fastapi**](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker)

But could be used as the base image to run any Python web application that uses the ASGI specification.

If you are creating a new [**Starlette**](https://www.starlette.io/) web application you should use [**tiangolo/uvicorn-gunicorn-starlette**](https://github.com/tiangolo/uvicorn-gunicorn-starlette-docker) instead.

If you are creating a new [**FastAPI**](https://fastapi.tiangolo.com/) web application you should use [**tiangolo/uvicorn-gunicorn-fastapi**](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker) instead.

**Note**: FastAPI is based on Starlette and adds several features on top of it. Useful for APIs and other cases: data validation, data conversion, documentation with OpenAPI, dependency injection, security/authentication and others.

**Note**: Unless you are doing something more technically advanced, you probably should be using [**Starlette**](https://www.starlette.io/) with [**tiangolo/uvicorn-gunicorn-starlette**](https://github.com/tiangolo/uvicorn-gunicorn-starlette-docker) or [**FastAPI**](https://fastapi.tiangolo.com/) with [**tiangolo/uvicorn-gunicorn-fastapi**](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker).

## How to use

* You don't need to clone the GitHub repo. You can use this image as a base image for other images, using this in your `Dockerfile`:

```Dockerfile
FROM rushilsrivastava/uvicorn-gunicorn:python3.7

COPY ./app /app
```

It will expect a file at `/app/app/main.py`.

Or otherwise a file at `/app/main.py`.

And will expect it to contain a variable `app` with your "ASGI" application.

Then you can build your image from the directory that has your `Dockerfile`, e.g:

```bash
docker build -t myimage ./
```

* Run a container based on your image:

```bash
docker run -d --name mycontainer -p 80:80 myimage
```

You should be able to check it in your Docker container's URL, for example: http://192.168.99.100/ or http://127.0.0.1/ (or equivalent, using your Docker host).

## Dependencies and packages

You will probably also want to add any dependencies for your app and pin them to a specific version, probably including Uvicorn and Gunicorn.

This way you can make sure your app always works as expected.

You could install packages with `pip` commands in your `Dockerfile`, using a `requirements.txt`, or even using [Poetry](https://python-poetry.org/).

And then you can upgrade those dependencies in a controlled way, running your tests, making sure that everything works, but without breaking your production application if some new version is not compatible.

### Using Poetry

Here's a small example of one of the ways you could install your dependencies making sure you have a pinned version for each package.

Let's say you have a project managed with [Poetry](https://python-poetry.org/), so, you have your package dependencies in a file `pyproject.toml`. And possibly a file `poetry.lock`.

Then you could have a `Dockerfile` like:

```Dockerfile
FROM rushilsrivastava/uvicorn-gunicorn:python3.7

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy using poetry.lock* in case it doesn't exist yet
COPY ./app/pyproject.toml ./app/poetry.lock* /app/

RUN poetry install --no-root --no-dev

COPY ./app /app
```

That will:

* Install poetry and configure it for running inside of the Docker container.
* Copy your application requirements.
    * Because it uses `./app/poetry.lock*` (ending with a `*`), it won't crash if that file is not available yet.
* Install the dependencies.
* Then copy your app code.

It's important to copy the app code *after* installing the dependencies, that way you can take advantage of Docker's cache. That way it won't have to install everything from scratch every time you update your application files, only when you add new dependencies.

This also applies for any other way you use to install your dependencies. If you use a `requirements.txt`, copy it alone and install all the dependencies on the top of the `Dockerfile`, and add your app code after it.

## Advanced usage

### Environment variables

These are the environment variables that you can set in the container to configure it and their default values:

#### `MODULE_NAME`

The Python "module" (file) to be imported by Gunicorn, this module would contain the actual application in a variable.

By default:

* `app.main` if there's a file `/app/app/main.py` or
* `main` if there's a file `/app/main.py`

For example, if your main file was at `/app/custom_app/custom_main.py`, you could set it like:

```bash
docker run -d -p 80:80 -e MODULE_NAME="custom_app.custom_main" myimage
```

#### `VARIABLE_NAME`

The variable inside of the Python module that contains the ASGI application.

By default:

* `app`

For example, if your main Python file has something like:

```Python
from fastapi import FastAPI

api = FastAPI()

@api.get("/")
def read_root():
    return {"message": "Hello world!"}
```

In this case `api` would be the variable with the "ASGI application". You could set it like:

```bash
docker run -d -p 80:80 -e VARIABLE_NAME="api" myimage
```

#### `APP_MODULE`

The string with the Python module and the variable name passed to Gunicorn.

By default, set based on the variables `MODULE_NAME` and `VARIABLE_NAME`:

* `app.main:app` or
* `main:app`

You can set it like:

```bash
docker run -d -p 80:80 -e APP_MODULE="custom_app.custom_main:api" myimage
```

#### `GUNICORN_CONF`

The path to a Gunicorn Python configuration file.

By default:

* `/app/gunicorn_conf.py` if it exists
* `/app/app/gunicorn_conf.py` if it exists
* `/gunicorn_conf.py` (the included default)

You can set it like:

```bash
docker run -d -p 80:80 -e GUNICORN_CONF="/app/custom_gunicorn_conf.py" myimage
```

You can use the [config file](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/docker-images/gunicorn_conf.py) from this image as a starting point for yours.

#### `WORKERS_PER_CORE`

This image will check how many CPU cores are available in the current server running your container.

It will set the number of workers to the number of CPU cores multiplied by this value.

By default:

* `1`

You can set it like:

```bash
docker run -d -p 80:80 -e WORKERS_PER_CORE="3" myimage
```

If you used the value `3` in a server with 2 CPU cores, it would run 6 worker processes.

You can use floating point values too.

So, for example, if you have a big server (let's say, with 8 CPU cores) running several applications, and you have an ASGI application that you know won't need high performance. And you don't want to waste server resources. You could make it use `0.5` workers per CPU core. For example:

```bash
docker run -d -p 80:80 -e WORKERS_PER_CORE="0.5" myimage
```

In a server with 8 CPU cores, this would make it start only 4 worker processes.

**Note**: By default, if `WORKERS_PER_CORE` is `1` and the server has only 1 CPU core, instead of starting 1 single worker, it will start 2. This is to avoid bad performance and blocking applications (server application) on small machines (server machine/cloud/etc). This can be overridden using `WEB_CONCURRENCY`.

#### `MAX_WORKERS`

Set the maximum number of workers to use.

You can use it to let the image compute the number of workers automatically but making sure it's limited to a maximum.

This can be useful, for example, if each worker uses a database connection and your database has a maximum limit of open connections.

By default it's not set, meaning that it's unlimited.

You can set it like:

```bash
docker run -d -p 80:80 -e MAX_WORKERS="24" myimage
```

This would make the image start at most 24 workers, independent of how many CPU cores are available in the server.

#### `WEB_CONCURRENCY`

Override the automatic definition of number of workers.

By default:

* Set to the number of CPU cores in the current server multiplied by the environment variable `WORKERS_PER_CORE`. So, in a server with 2 cores, by default it will be set to `2`.

You can set it like:

```bash
docker run -d -p 80:80 -e WEB_CONCURRENCY="2" myimage
```

This would make the image start 2 worker processes, independent of how many CPU cores are available in the server.

#### `HOST`

The "host" used by Gunicorn, the IP where Gunicorn will listen for requests.

It is the host inside of the container.

So, for example, if you set this variable to `127.0.0.1`, it will only be available inside the container, not in the host running it.

It's is provided for completeness, but you probably shouldn't change it.

By default:

* `0.0.0.0`

#### `PORT`

The port the container should listen on.

If you are running your container in a restrictive environment that forces you to use some specific port (like `8080`) you can set it with this variable.

By default:

* `80`

You can set it like:

```bash
docker run -d -p 80:8080 -e PORT="8080" myimage
```

#### `BIND`

The actual host and port passed to Gunicorn.

By default, set based on the variables `HOST` and `PORT`.

So, if you didn't change anything, it will be set by default to:

* `0.0.0.0:80`

You can set it like:

```bash
docker run -d -p 80:8080 -e BIND="0.0.0.0:8080" myimage
```

#### `LOG_LEVEL`

The log level for Gunicorn.

One of:

* `debug`
* `info`
* `warning`
* `error`
* `critical`

By default, set to `info`.

If you need to squeeze more performance sacrificing logging, set it to `warning`, for example:

You can set it like:

```bash
docker run -d -p 80:8080 -e LOG_LEVEL="warning" myimage
```

#### `WORKER_CLASS`

The class to be used by Gunicorn for the workers.

By default, set to `uvicorn.workers.UvicornWorker`.

The fact that it uses Uvicorn is what allows using ASGI applications like FastAPI and Starlette, and that is also what provides the maximum performance.

You probably shouldn't change it.

But if for some reason you need to use the alternative Uvicorn worker: `uvicorn.workers.UvicornH11Worker` you can set it with this environment variable.

You can set it like:

```bash
docker run -d -p 80:8080 -e WORKER_CLASS="uvicorn.workers.UvicornH11Worker" myimage
```

#### `TIMEOUT`

Workers silent for more than this many seconds are killed and restarted.

Read more about it in the [Gunicorn docs: timeout](https://docs.gunicorn.org/en/stable/settings.html#timeout).

By default, set to `120`.

Notice that Uvicorn and ASGI frameworks like FastAPI and Starlette are async, not sync. So it's probably safe to have higher timeouts than for sync workers.

You can set it like:

```bash
docker run -d -p 80:8080 -e TIMEOUT="20" myimage
```

#### `KEEP_ALIVE`

The number of seconds to wait for requests on a Keep-Alive connection.

Read more about it in the [Gunicorn docs: keepalive](https://docs.gunicorn.org/en/stable/settings.html#keepalive).

By default, set to `2`.

You can set it like:

```bash
docker run -d -p 80:8080 -e KEEP_ALIVE="20" myimage
```

#### `GRACEFUL_TIMEOUT`

Timeout for graceful workers restart.

Read more about it in the [Gunicorn docs: graceful-timeout](https://docs.gunicorn.org/en/stable/settings.html#graceful-timeout).

By default, set to `120`.

You can set it like:

```bash
docker run -d -p 80:8080 -e GRACEFUL_TIMEOUT="20" myimage
```

#### `ACCESS_LOG`

The access log file to write to.

By default `"-"`, which means stdout (print in the Docker logs).

If you want to disable `ACCESS_LOG`, set it to an empty value.

For example, you could disable it with:

```bash
docker run -d -p 80:8080 -e ACCESS_LOG= myimage
```

#### `ERROR_LOG`

The error log file to write to.

By default `"-"`, which means stderr (print in the Docker logs).

If you want to disable `ERROR_LOG`, set it to an empty value.

For example, you could disable it with:

```bash
docker run -d -p 80:8080 -e ERROR_LOG= myimage
```

#### `GUNICORN_CMD_ARGS`

Any additional command line settings for Gunicorn can be passed in the `GUNICORN_CMD_ARGS` environment variable.

Read more about it in the [Gunicorn docs: Settings](https://docs.gunicorn.org/en/stable/settings.html#settings).

These settings will have precedence over the other environment variables and any Gunicorn config file.

For example, if you have a custom TLS/SSL certificate that you want to use, you could copy them to the Docker image or mount them in the container, and set [`--keyfile` and `--certfile`](http://docs.gunicorn.org/en/latest/settings.html#ssl) to the location of the files, for example:

```bash
docker run -d -p 80:8080 -e GUNICORN_CMD_ARGS="--keyfile=/secrets/key.pem --certfile=/secrets/cert.pem" -e PORT=443 myimage
```

**Note**: instead of handling TLS/SSL yourself and configuring it in the container, it's recommended to use a "TLS Termination Proxy" like [Traefik](https://docs.traefik.io/). You can read more about it in the [FastAPI documentation about HTTPS](https://fastapi.tiangolo.com/deployment/#https).

#### `UVICORN_ARGS`

Any additional command line settings for Uvicorn can be passed in the `UVICORN_ARGS` environment variable.

Read more about it in the [Uvicorn docs: Settings](https://www.uvicorn.org/settings/).

For example, if you have only one directory you want to watch for reloading, you could set [`--reload-dir`](https://www.uvicorn.org/settings/#development) to the directory, for example:

```bash
docker run -d -p 80:8080 -e UVICORN_ARGS="--reload-dir=/app" myimage
```

#### `PRE_START_PATH`

The path where to find the pre-start script.

By default, set to `/prestart.sh`. The image will check these paths first: `/app/prestart.sh`, `/app/app/prestart.sh`, `/app/scripts/prestart.sh`, and `/app/app/scripts/prestart.sh`.

You can set it like:

```bash
docker run -d -p 80:8080 -e PRE_START_PATH="/custom/script.sh" myimage
```

### Custom Gunicorn configuration file

The image includes a default Gunicorn Python config file at `/gunicorn_conf.py`.

It uses the environment variables declared above to set all the configurations.

You can override it by including a file in:

* `/app/gunicorn_conf.py`
* `/app/app/gunicorn_conf.py`
* `/gunicorn_conf.py`

### Custom `/prestart.sh`

If you need to run anything before starting the app, you can add a file `prestart.sh` to the directory `/app`. The image will automatically detect and run it before starting everything.

For example, if you want to add Alembic SQL migrations (with SQLALchemy), you could create a `./prestart.sh` file in your code directory (that will be copied by your `Dockerfile`) with:

```bash
#! /usr/bin/env bash

# Let the DB start
sleep 10;
# Run migrations
alembic upgrade head
```

and it would wait 10 seconds to give the database some time to start and then run that `alembic` command.

If you need to run a Python script before starting the app, you could make the `/app/prestart.sh` file run your Python script, with something like:

```bash
#! /usr/bin/env bash

# Run custom Python script before starting
python /app/my_custom_prestart_script.py
```

You can customize the location of the prestart script with the environment variable `PRE_START_PATH` described above.

### Development live reload

The default program that is run is at `/start.sh`. It does everything described above.

There's also a version for development with live auto-reload at:

```bash
/start-reload.sh
```

#### Details

For development, it's useful to be able to mount the contents of the application code inside of the container as a Docker "host volume", to be able to change the code and test it live, without having to build the image every time.

In that case, it's also useful to run the server with live auto-reload, so that it re-starts automatically at every code change.

The additional script `/start-reload.sh` runs Uvicorn alone (without Gunicorn) and in a single process.

It is ideal for development.

#### Usage

For example, instead of running:

```bash
docker run -d -p 80:80 myimage
```

You could run:

```bash
docker run -d -p 80:80 -v $(pwd):/app myimage /start-reload.sh
```

* `-v $(pwd):/app`: means that the directory `$(pwd)` should be mounted as a volume inside of the container at `/app`.
    * `$(pwd)`: runs `pwd` ("print working directory") and puts it as part of the string.
* `/start-reload.sh`: adding something (like `/start-reload.sh`) at the end of the command, replaces the default "command" with this one. In this case, it replaces the default (`/start.sh`) with the development alternative `/start-reload.sh`.

#### Development live reload - Technical Details

As `/start-reload.sh` doesn't run with Gunicorn, any of the configurations you put in a `gunicorn_conf.py` file won't apply.

But these environment variables will work the same as described above:

* `MODULE_NAME`
* `VARIABLE_NAME`
* `APP_MODULE`
* `HOST`
* `PORT`
* `LOG_LEVEL`

## Tests

All the image tags, configurations, environment variables and application options are tested.

## Release Notes

### Latest Changes

### 0.7.0

* 👷🏽 Convert build scripts to use poetry. PR [#6](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/pull/6) by [@rushilsrivastava](https://github.com/rushilsrivastava).
* ✅ Add tests, update args. PR [#5](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/pull/5) by [@rushilsrivastava](https://github.com/rushilsrivastava).
* 🐛 Convert env to args. PR [#4](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/pull/4) by [@rushilsrivastava](https://github.com/rushilsrivastava).
* 📝 Cleanup README. PR [#3](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/pull/3) by [@rushilsrivastava](https://github.com/rushilsrivastava).
* 🐛 Update initial args schema. PR [#2](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/pull/2) by [@rushilsrivastava](https://github.com/rushilsrivastava).
* 🎨 Update authors, add new versions and organization. PR [#1](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/pull/1) by [@rushilsrivastava](https://github.com/rushilsrivastava).
* 🔥 Remove unused Travis and old GitHub Actions configs. PR [#56](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/56) by [@tiangolo](https://github.com/tiangolo).
* ✏️ Fix typo (type annotation) in tests. PR [#55](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/55) by [@tiangolo](https://github.com/tiangolo).
* 👷 Add GitHub Action latest-changes, update issue-manager, add funding. PR [#53](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/53) by [@tiangolo](https://github.com/tiangolo).
* ⬆️ Install uvicorn[standard] to include uvloop and Gunicorn support. PR [#54](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/54) by [@tiangolo](https://github.com/tiangolo).

### 0.6.0

* Add docs about installing and pinning dependencies. PR [#41](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/41).
* Add `slim` version. PR [#40](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/40).
* Remove leftover unneeded config for tests. PR [#39](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/39).
* Add extra configs, tests, and docs for:
    * `WORKER_CLASS`
    * `TIMEOUT`
    * `KEEP_ALIVE`
    * `GRACEFUL_TIMEOUT`
    * `ACCESS_LOG`
    * `ERROR_LOG`
    * `GUNICORN_CMD_ARGS`
    * `MAX_WORKERS`
    * PR [#38](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/38)
* Set up CI using GitHub actions, they provide more free instances, so builds finish faster (4 min vs 9 min). PR [#37](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/37).
* Add support for Python 3.8. PR [#36](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/36).
* Refactor tests to remove custom testing Dockerfiles, generate them during tests. PR [#35](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/35).
* Refactor and simplify build process to reduce code duplication. PR [#34](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/34).
* Disable `pip` cache during installation with `--no-cache-dir`. PR [#13](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/13) by [@pmav99](https://github.com/pmav99).
* Migrate local development from Pipenv to Poetry. PR [#31](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/31).
* Add tests and docs for custom `PRE_START_PATH` env var. PR [#30](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/30).
* Add support for custom `PRE_START_PATH` env var. PR [#12](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/12) by [@mgfinch](https://github.com/mgfinch).

### 0.5.0

* Refactor tests to use env vars and add image tags for each build date, like `tiangolo/uvicorn-gunicorn:python3.7-2019-10-15`. PR [#15](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/15).
* Update Gunicorn worker heartbeat directory to `/dev/shm` to improve performance. PR [#9](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/9) by [@wshayes](https://github.com/wshayes).
* Upgrade Travis. PR [#7](https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/7).

### 0.4.0

* Add support for live auto-reload with an additional custom script `/start-reload.sh`, check the [updated documentation](https://github.com/tiangolo/uvicorn-gunicorn-docker#development-live-reload). PR <a href="https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/6" target="_blank">#6</a>.

### 0.3.0

* Set `WORKERS_PER_CORE` by default to `1`, as it shows to have the best performance on benchmarks.
* Make the default web concurrency, when `WEB_CONCURRENCY` is not set, to a minimum of 2 workers. This is to avoid bad performance and blocking applications (server application) on small machines (server machine/cloud/etc). This can be overridden using `WEB_CONCURRENCY`. This applies for example in the case where `WORKERS_PER_CORE` is set to `1` (the default) and the server has only 1 CPU core. PR <a href="https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/5" target="_blank">#5</a>.

### 0.2.0

* Make `/start.sh` run independently, reading and generating used default environment variables. And remove `/entrypoint.sh` as it doesn't modify anything in the system, only reads environment variables. PR <a href="https://github.com/tiangolo/uvicorn-gunicorn-docker/pull/4" target="_blank">#4</a>.

### 0.1.2

* Whenever this image is built (and each of its tags/versions), trigger a build for the children images (<a href="https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker" target="_blank">FastAPI</a> and <a href="https://github.com/tiangolo/uvicorn-gunicorn-starlette-docker" target="_blank">Starlette</a>).

### 0.1.0

* Add support for `/app/prestart.sh`.

## License

This project has been forked from [tiangolo/uvicorn-gunicorn-docker](https://github.com/tiangolo/uvicorn-gunicorn-docker/blob/8748ba16cb9d4c8e4e5a99975438159ada14322c/LICENSE), which is licensed under the [MIT license](https://github.com/tiangolo/uvicorn-gunicorn-docker/LICENSE). All changes made in this fork have been licensed via the [MIT License](https://github.com/rushilsrivastava/uvicorn-gunicorn-docker/blob/master/LICENSE).
