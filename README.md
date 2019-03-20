# GNU GLOBAL in Docker

You can simply read source code with Web Browser !!

## How to use

1. Preparing the Docker environment

```
$ docker build -t reading .
$ docker run -p 8888:80 -itd reading # Access to http://localhost:8888/src/hogehoge/HTML
```

2. Putting source codes that you want to read `/usr/local/src` and creating html files with `gtags` and `htags` commands
3. Access to `http://localhost:8888/src/hogehoge/HTML` with the web browser
