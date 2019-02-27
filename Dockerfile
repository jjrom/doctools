FROM alpine:3.9

ENV SWAGGER_PHP_VERSION 3.0.2
ENV API2HTML_VERSION 0.3.0
ENV WIDDERSHINS_VERSION 3.6.7
ENV ASCIIDOCTORPDF_VERSION 1.5.0.alpha.16
ENV ROUGE_VERSION 3.3.0

ENV PANDOC_VERSION 2.6
ENV PANDOC_DOWNLOAD_URL https://github.com/jgm/pandoc/archive/$PANDOC_VERSION.tar.gz
ENV PANDOC_ROOT /usr/local/pandoc

RUN apk update \
 && apk add --no-cache bash gmp libffi ruby ruby-rdoc python2 php7 composer npm

# openapi
RUN composer global require zircote/swagger-php:$SWAGGER_PHP_VERSION

# api2html, widdershins
RUN npm i api2html@$API2HTML_VERSION widdershins@$WIDDERSHINS_VERSION -g

# asciidoctor-pdf
RUN gem install asciidoctor-pdf -v $ASCIIDOCTORPDF_VERSION  --pre
RUN gem install rouge -v $ROUGE_VERSION

# pandoc (note || true after cabal install to avoid non zero code exit due to warning on existing symlink creation)
RUN apk add --no-cache --virtual build-dependencies \
    ghc \
    cabal \
    linux-headers \
    musl-dev \
    zlib-dev \
    curl \
 && mkdir -p /pandoc-build && cd /pandoc-build \
 && curl -fsSL "$PANDOC_DOWNLOAD_URL" -o pandoc.tar.gz \
 && tar -xzf pandoc.tar.gz && rm -f pandoc.tar.gz \
 && ( cd pandoc-$PANDOC_VERSION && cabal update && cabal install --only-dependencies || true \
    && cabal configure --prefix=$PANDOC_ROOT \
    && cabal build \
    && cabal copy || true \
    && cd .. ) \
 && rm -Rf pandoc-$PANDOC_VERSION/ \
 && apk del --purge build-dependencies \
 && rm -Rf /root/.cabal/ /root/.ghc/ \
 && cd / && rm -Rf /pandoc-build

ENV PATH "$PATH:/root/.composer/vendor/bin:$PANDOC_ROOT/bin"

RUN mkdir /workdir
ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
