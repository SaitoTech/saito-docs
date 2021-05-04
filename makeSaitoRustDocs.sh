#!/bin/bash
for i in "$@"
do
case $i in
    -sl=*|--source=*)
    SOURCE="${i#*=}"
    shift
    ;;
    *)
    echo "unknown argument"
    echo "${i#*=}"
    exit 1
    ;;
esac
done
if [[ SOURCE ]]; then
  SOURCE="../saito-rust"
fi

echo "Generating docs from '${SOURCE}' (use --saitolite to configure)"
DIR=$(pwd)
cd ../saito-rust && cargo doc --no-deps --target-dir=$DIR/saitorustdocs 
#../saito-rust/src/main.rs
