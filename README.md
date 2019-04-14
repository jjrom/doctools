# doctools
Docker swiss army knife for documentation generation

The jjrom/doctools docker image gives access to the following command line application

* [openapi](https://github.com/zircote/swagger-php)
* [api2html](https://github.com/tobilg/api2html)
* [widdershins](https://www.npmjs.com/package/widdershins)
* [pandoc](http://pandoc.org)
* [asciidoctor-pdf](https://asciidoctor.org)
* [openapi2postmanv2](https://github.com/postmanlabs/openapi-to-postman)

## Installation 

### From dockerhub

    docker pull jjrom/doctools:2.0

### Build from source
Launch the following command and go for a (long) coffee break

    docker build -t jjrom/doctools:2.0 .

## Usage
Replace ${COMMAND} with one of {openapi|api2html|widdershins|pandoc|asciidoctor-pdf}

    docker run --rm -ti jjrom/doctools:2.0

*Note: input files must be mounted with docker -v option to be accessed by the tools*

## FAQ

### pandoc build error returned a non-zero code: 137

In Mac, to tackle with it, you might want to try changing memory allocation in Docker > Preference > Memory. Mostly increase will work.