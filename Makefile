typst := libs/typst
archive_name := typst-x86_64-unknown-linux-musl

# Override name by using `make name='different-name'`.
# Reference: https://earthly.dev/blog/makefile-variables/
name := resume
template := template.typ
result := $(name).pdf
info := info.yaml

# PHONY is to indicate that the content is not
# a file name. So if there's file named `all`,
# we still execute this `all` target.
# References:
# - https://makefiletutorial.com/
# - https://stackoverflow.com/a/26923107
.PHONY: all
all: $(typst) $(result)
	@:

$(typst):
	tar xf libs/$(archive_name).tar.xz \
		-C libs/ \
		--strip-components=1 \
		$(archive_name)/typst

$(result): $(template) $(info)
	$(typst) compile $(template) $(result)
