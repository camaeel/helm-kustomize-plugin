#!/usr/bin/env sh

KUSTOMIZATION_PATH=$1
BASE_FILE=${2:-base.yaml}
if [ -z "$KUSTOMIZATION_PATH" ]; then
    echo "kustomization path is not set" >&1
    exit 3
fi

if ! kubectl version --client >/dev/null 2>&1; then
    echo "kubectl is not installed or not configured correctly" >&1
    exit 2
fi

cat <&0 > "$KUSTOMIZATION_PATH/$BASE_FILE"

set -e
set -o pipefail
kubectl kustomize "$KUSTOMIZATION_PATH" && rm "$KUSTOMIZATION_PATH/$BASE_FILE"