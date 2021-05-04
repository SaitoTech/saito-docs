#!/bin/bash

for i in "$@"
do
case $i in
    -sl=*|--sailolite=*)
    SAITOLITE="${i#*=}"
    shift
    ;;
    *)
    echo "unknown argument"
    echo "${i#*=}"
    exit 1
    ;;
esac
done
if [[ SAITOLITE ]]; then
  SAITOLITE="../saito-lite"
fi
echo "Generating docs from '${SAITOLITE}' (use --saitolite to configure)"

jsdoc --destination saitelitedocs/ \
      ${SAITOLITE}/lib/templates/abstractcryptomodule.js \
      ${SAITOLITE}/lib/templates/substratebasedcrypto.js \
      ${SAITOLITE}/lib/saito/wallet.js \
      ${SAITOLITE}/README.md
      
echo '#main .page-title {display: none}' >> web/styles/jsdoc-default.css
