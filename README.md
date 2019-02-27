# doctools
Docker swiss army knife for documentation generation

The jjrom/doctools docker image gives access to the following command line application

* [openapi](https://github.com/zircote/swagger-php)
* [api2html](https://github.com/tobilg/api2html)
* [widdershins](https://www.npmjs.com/package/widdershins)
* [pandoc](http://pandoc.org)
* [asciidoctor-pdf](https://asciidoctor.org)

## Installation
Launch the following command and go for a (long) coffee break

    docker build -t jjrom/doctools .

## Usage
Replace ${COMMAND} with one of {openapi|api2html|widdershins|pandoc|asciidoctor-pdf}

    docker run --rm -ti jjrom/doctools 

*Note: input files must be mounted with docker -v option to be accessed by the tools*
