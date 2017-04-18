# docker-gitbook-calibre

[gitbook](https://www.gitbook.com/) w/z [calibre](https://calibre-ebook.com/) installed CentOS7 on Docker.

## Usage

```
# pull
docker pull officel/docker-gitbook-calibre

# alias(add your .bashrc or any)
# font for Language. use .ttf write book.json you have.
alias gitbook='docker run --rm -v "$PWD":/gitbook -v /usr/share/fonts:/usr/share/fonts -p 4000:4000 --name gitbook officel/docker-gitbook-calibre gitbook'

cd "your books directory"

# init
gitbook init

# add plugins in book.json
gitbook install

# build
gitbook build

# serve
gitbook serve

# serve stop (--name)
docker stop gitbook


# output pdf,epub or mobi
gitbook pdf .

```


