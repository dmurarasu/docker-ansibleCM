docker run -it --rm \
    -u ansible:ansible \
    -v $(pwd):/ansible \
    dan/ansible:ubuntu $@
