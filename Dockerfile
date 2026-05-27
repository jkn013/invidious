FROM crystal:latest

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libxml2-dev \
    libyaml-dev \
    libgmp-dev \
    curl \
    git

WORKDIR /app

COPY . .

RUN shards install
RUN crystal build src/invidious.cr --release

CMD ["./invidious"]
