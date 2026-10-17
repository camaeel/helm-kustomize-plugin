# helm-kustomize-plugin

This is a very simply plugin to kustomize helm charts with helm v4. 

## Installation 

```
helm plugin install oci://ghcr.io/camaeel/helm-kustomize-plugin/kustomize
```

## Usage

helm upgrade --install ...  --post-renderer kustomize --post-renderer-args tests/kustomize

### Parameters

kustomize postrenderer plugin has 2 parameters:
* kustomization path - path containing kusomization.yaml file
* (optional) temporary base manifest - set by default to base.yaml This file should be referenced by kustomization.yaml as source:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - base.yaml

patches:
  ...
```