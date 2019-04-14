#!/bin/bash
command=$1
shift;
case "$command" in
    openapi)
        exec openapi "$@"
        ;;
  
    api2html)
        exec api2html "$@"
        ;;

    widdershins)
        exec widdershins "$@"
        ;;

    pandoc)
        exec pandoc "$@"
        ;;

    asciidoctor-pdf)
        exec asciidoctor-pdf "$@"
        ;;

    openapi2postmanv2)
        exec openapi2postmanv2 "$@"
        ;;

    debug)
        exec /bin/bash
        ;;

    *)
        echo $"[ERROR] Choose one command between {openapi|api2html|widdershins|pandoc|asciidoctor-pdf|openapi2postmanv2}"
        exit 1

esac
