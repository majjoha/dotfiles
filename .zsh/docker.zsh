idris () {
  docker run -t -i majjoha/idris idris
}

blog () {
  docker run \
    -p 4000:4000 \
    -v $(pwd):/app \
    -d \
    majjoha/blog
}
