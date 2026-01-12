FROM node:24

RUN npm install -g @augmentcode/auggie

ARG UID=1000

USER $UID
WORKDIR /app

ENTRYPOINT [ "auggie" ]