#!/bin/sh

# Se un comando fallisce, fermati
set -e

# Costruisci il sito
hugo

# Vai nella directory pubblica
cd public

# Aggiungi tutti i cambiamenti
git add .

# Fai un commit
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Spingi i cambiamenti sul branch gh-pages
git push origin gh-pages
