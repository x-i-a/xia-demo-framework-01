.PHONY: all init plan apply destroy init-module

all:
	@echo "Specify a command to run"

init:
	python3 -m venv .venv; \
	until [ -f .venv/bin/python3 ]; do sleep 1; done; \
	until [ -f .venv/bin/activate ]; do sleep 1; done;
	. .venv/bin/activate; \
    pip install git+https://github.com/x-i-a/xia-framework.git; \
	pip install PyYAML keyring setuptools wheel; \
    pip install keyrings.google-artifactregistry-auth; \

plan: init
	@. .venv/bin/activate; \
	if [ -z "$(env_name)" ]; then \
	    echo "Environment name not specified. Usage: make plan env_name=<env_name>"; \
	else \
	    python -m xia_framework.application plan -e $(env_name); \
    fi

apply: init
	@. .venv/bin/activate; \
	if [ -z "$(env_name)" ]; then \
	    echo "Environment name not specified. Usage: make plan env_name=<env_name>"; \
	else \
	    python -m xia_framework.application apply -e $(env_name); \
    fi

destroy: init
	@. .venv/bin/activate; \
	python -m xia_framework.application destroy

init-module: init
	@. .venv/bin/activate; \
	if [ -z "$(module_uri)" ] ; then \
		echo "Module URI not specified. Usage: make init-module module_uri=<package_name>@<version>/<module_name>"; \
	else \
		python -m xia_framework.application init-module -n $(module_uri); \
	fi


