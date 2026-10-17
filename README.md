# helm-kustomize-plugin

This is a very simply plugin to kustomize helm charts with helm v4. 

## Installation 

```
wget https://github.com/camaeel/helm-kustomize-plugin/raw/refs/heads/master/helm-kustomize-plugin.gpg
helm plugin install --keyring helm-kustomize-plugin.gpg oci://ghcr.io/camaeel/helm-kustomize-plugin/kustomize:latest
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

## Development


### Preparing signing keys

```shell
gpg --quick-generate-key "helm-kustomize-plugin" rsa4096 sign 1y
gpg --batch --export-secret-keys helm-kustomize-plugin |
  base64 |
  tr -d '\n' 
# put this as GPG_KEYRING_BASE64 secret in repo

# export public key
gpg --armor --export helm-kustomize-plugin 

```