## Crystal Beginner's Dev Container

A repo with [dev container][devcontainers-spec] config file and example Crystal code, so that you can quickly spin up an environment to write and compile crystal code with VS Code.

### Quick Start

1. Install VS Code and Docker if you don't have them installed
2. Clone and/or open the repository with VS Code
3. `Ctrl + P` to get the VS Code command palette and then type/select "Dev Containers: Open Folder in Container..."

> VS Code will see the config file (`.devcontainer/devcontainer.json`) and automatically use that.

The files `src/cli/beatles.cr` and `src/webapp/hello-word.cr` are taken from the [Crystal Getting Started Guide][crystal-tutorial]

Run this to try out the beatles cli:

```bash
# make a directory for compiled executables and add it to the lookup path
mkdir bin
export PATH=$PATH:./bin
# compile the code
crystal build ./src/cli/beatles.cr  -o ./bin/beatles

# try out the compiled code
beatles --strawberry --twist
```

Or run this to start the "Hello World" web server:
```bash
crystal build ./src/webapp/hello-world.cr
```

Or try this example of a web server that uses a library (known as a "shard" in Crystal land) to read from a Postgres database.  
(This one's probably better to do outside of a dev container, or you'll be running docker in docker...)
```bash
cd /src/postgres
docker compose up --build -d
# wait for the app to spin up and the browse ot it in localhost:8088
# and then clean up afterwards...
docker compose down -v
```


[devcontainers-spec]: https://containers.dev/
[crystal-tutorial]: https://crystal-lang.org/reference/1.8/getting_started/