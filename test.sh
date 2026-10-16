#!/usr/bin/env sh

set -e
set -o pipefail

if [ ! -d "tests/test-chart" ]; then
    cd tests
    helm create test-chart
    cd ..
fi

# helm plugin uninstall kustomize || true
# helm plugin install .

helm template tests/test-chart --post-renderer kustomize --post-renderer-args tests/kustomize --debug -s templates/deployment.yaml 


REPLICAS=$(helm template tests/test-chart --post-renderer kustomize --post-renderer-args tests/kustomize -s templates/deployment.yaml | yq -r '.spec.replicas')

if [ "$REPLICAS" -eq 99 ]; then
    echo "Test successful. Replicas successfully patched to 99"
else
    echo "Test failed. Failed to patch replicas. Got $REPLICAS"
fi
