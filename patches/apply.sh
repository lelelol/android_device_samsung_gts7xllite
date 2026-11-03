#!/bin/bash
# Apply the AOSP/LineageOS platform patches on top of a lineage-24.0 checkout.
# usage: ./apply.sh <path to the lineage-24.0 source tree>
set -e
top=$(cd "${1:?usage: $0 <lineage-24.0 tree>}" && pwd)
here=$(cd "$(dirname "$0")" && pwd)
for d in "$here"/aosp/*/; do
  dir=$(basename "$d")
  case $dir in
    hardware_qcom-caf_sm8250_media) path=hardware/qcom-caf/sm8250/media ;;
    *) path=${dir//_//} ;;
  esac
  echo "== $path"
  git -C "$top/$path" am -3 "$d"*.patch
done
