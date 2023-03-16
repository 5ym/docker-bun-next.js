FROM oven/bun
ENV NODE_ENV=production
RUN chown -R bun:bun .
USER bun
COPY --chown=bun:bun package.json .
COPY --chown=bun:bun bun.lockb .
COPY --chown=bun:bun bunfig.toml .
RUN bun i -p
COPY --chown=bun:bun . .
RUN bun run next build
EXPOSE 3000
ENTRYPOINT [ "bun" ]
CMD [ "run", "next", "start" ]