install:
	helm plugin uninstall kustomize || true
	helm plugin install https://github.com/camaeel/helm-kustomize-plugin --verify=false --version=initial

test:
	./test.sh

install_local:
	helm plugin uninstall kustomize || true
	helm plugin install .