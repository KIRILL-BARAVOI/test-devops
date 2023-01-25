FROM node:alpine3.17

LABEL   author="Kirill Borovoy" \
        email="kirill_borovoy@epam.com"

ENV NODE_ENV=

WORKDIR "/app"

COPY . .

RUN npm ci && npm cache clean --force

USER node

CMD ["npm", "start"]
