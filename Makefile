.NOTPARALLEL:

export PYTHONPATH := ${CURDIR}/python

.PHONY: build
build:
	cd pooled-jms && make build
	cd qpid-jms && make build
	cd qpid-proton-cpp && make build
	cd qpid-proton-python && make build
	cd rhea && make build
	cd vertx-proton && make build

.PHONY: test
test: build
	scripts/test --timeout 10

.PHONY: clean
clean:
	cd pooled-jms && make clean
	cd qpid-jms && make clean
	cd qpid-proton-cpp && make clean
	cd qpid-proton-python && make clean
	cd rhea && make clean
	cd vertx-proton && make clean
	find python -name \*.pyc -delete

.PHONY: update-%
update-%:
	curl "https://raw.githubusercontent.com/ssorj/$*/master/python/$*.py" -o python/$*.py
