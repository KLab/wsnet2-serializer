
SUBDIRS := csharp go

.PHONY: test $(SUBDIRS)

test: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@
