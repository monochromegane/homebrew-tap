.PHONY: devel-deps
devel-deps:
	brew install Songmu/tap/maltmill

.PHONY: update
update/%:
	maltmill -w $*.rb

.PHONY: create
create/%:
	maltmill new -w monochromegane/$*

.PHONY: update-all
update-all:
	grep -l darwin *.rb | xargs -n 1 maltmill -w
