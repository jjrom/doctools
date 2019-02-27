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

    *)
        echo $"[ERROR] Choose one command between {openapi|api2html|widdershins|pandoc|asciidoctor-pdf}"
        exit 1

esac
