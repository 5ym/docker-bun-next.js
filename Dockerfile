FROM node:lts-bullseye-slim
WORKDIR /usr/src/app
RUN npm i -g npm && npm i -g bun && chown -R node:node .
USER node
COPY --chown=node:node package.json .
COPY --chown=node:node bun.lockb .
COPY --chown=node:node bunfig.toml .
RUN bun i -p
COPY --chown=node:node . .
RUN bun run build
EXPOSE 3000
ENTRYPOINT [ "bun" ]
CMD [ "run", "next", "start" ]