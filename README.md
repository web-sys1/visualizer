# FFMPEG style visualizer

## Purpose
Just loving displayed music

## Usage
See index.html for help

## Build
Minify: `docker run --rm -v /home/web/visualizer:/work dev gulp`

Alternatively:

```sh
docker build -t dev .
docker run --rm -p 8080:80 dev
```

## License
MIT