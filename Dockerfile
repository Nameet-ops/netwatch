FROM alpine:3.19

RUN apk add --no-cache bash curl netcat-openbsd iputils 

WORKDIR /app

COPY . .

RUN chmod +x monitor.sh

CMD ["bash" , "-c", "while true; do ./monitor.sh; sleep 60; done"]

