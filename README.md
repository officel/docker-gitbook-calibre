# docker-gitbook-calibre

[gitbook](https://www.gitbook.com/) w/z [calibre](https://calibre-ebook.com/) installed CentOS7 on Docker.

## Usage

```
# pull
docker pull officel/docker-gitbook-calibre

# alias(add your .bashrc or any)
alias gitbook='docker run --rm -v "$PWD":/gitbook -p 4000:4000 officel/docker-gitbook-calibre gitbook'

cd "your books directory"

# init
gitbook init

# build
gitbook build

# serve
gitbook serve

# @memo CTRL + C is can stop container by messages. but can't? so use docker ps,docker stop.

# output pdf,epub or mobi
gitbook pdf .

```


