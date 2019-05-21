#!/bin/bash
set -euxo pipefail

if ! [ -x "$(command -v rename)" ]; then
  echo 'Rename command is not installed.' >&2
  exit 1
fi

if ! [[ -d $1 ]]; then
  echo 'First argument must be a library name." >&2
  exit 1
fi

# Rename all project source files to lower case
cd $1; rename -f 'y/A-Z/a-z/' *.c *.h *.C *.H; cd -

# Lowercase C-pre-processor style includes in source files
sed -E -i 's/(^#include\s+.*\/)(.+)/\1\L\2/' $1/*
sed -E -i 's/(^#include\s+.*")(.+")/\1\L\2/' $1/* # For local includes

# Replace backslashes for slashes to hopefully change relative Windows
# paths to POSIX without breaking anything
sed -i '#^\#include#s#\\#/#g' $1/*

# Remove all carriage returns
sed -i 's/\r//g' $1/*

# Replace windows specific process.h file for stdlib.h
sed -i '/^#include/s/process.h/stdlib.h/g' $1/*

# Correct include path, due to incosistent notation by original author
sed -i 's/\\tabelas\\idtiposespaco.def/\/Tabelas\/IdTiposEspaco.def/' $1/*
sed -i 's/\/tabelas\/idtiposespaco.def/\/Tabelas\/IdTiposEspaco.def/' ./Fontes/*

if ! grep -q 'int __iscsym' $1/lerparm.c; then
	echo "int __iscsym( int c ) {if ( isalnum( c ) || c == '_'  ){return 1;}else{return 0;}}" \
	>> $1/lerparm.c;
	echo 'Adding __iscsym function definition to ./Fontes/lerparm.c'
fi
