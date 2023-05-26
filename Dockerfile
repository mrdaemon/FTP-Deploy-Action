FROM alpine:3.11

LABEL maintainer="Alexandre Gauthier <alex@lab.underwares.org>"

RUN apk --no-cache add curl bash git nodejs libssh2-dev build-base

RUN curl https://raw.githubusercontent.com/git-ftp/git-ftp/1.6.0/git-ftp > /bin/git-ftp
RUN chmod 755 /bin/git-ftp

COPY dist/index.js /deploy.js
RUN chmod +x deploy.js

ENTRYPOINT ["node", "../../deploy.js"]
