FROM node:24

RUN npm install -g @augmentcode/auggie

ARG UID=1000

RUN deluser --remove-all-files $UID || true
RUN useradd -m -u $UID -d /home/auggie -s /bin/bash auggie 

USER $UID
WORKDIR /app

ENTRYPOINT [ "auggie" ]