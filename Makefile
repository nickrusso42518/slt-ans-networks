# File:    Makefile
# Version: GNU Make 3.81
# Author:  Nicholas Russo (njrusmc@gmail.com)
.PHONY: lint
lint:
	@echo "Starting  lint"
	find . -name "*.yml" | xargs yamllint -s
	@echo "Completed lint"
