blog () {
  docker run \
    -p 4000:4000 \
    -v $(pwd):/app \
    -d \
    majjoha/blog
}

docker-gc () {
  docker run \
    --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc:/etc \
    spotify/docker-gc
}
