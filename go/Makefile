
# stringer targets
stringer := $(shell grep -r '^//go:generate stringer' --include='*.go' . | \
                sed -E 's/^\.\/([^:]*):.* -type=([0-9a-zA-Z]*).*$$/\1>\2_string.go/g')
string.go := $(foreach s,$(stringer),\
                 $(dir $(word 1,$(subst >, ,$(s))))$(shell echo $(word 2,$(subst >, ,$(s))) | tr A-Z a-z))

.PHONY: test tools generate

test: tools $(string.go)
	go test ./...

tools:
ifeq (, $(shell which stringer))
	go install golang.org/x/tools/cmd/stringer@latest
endif

generate: $(string.go)

define stringer_rule
$(eval _1 := $(word 1,$(1)))
$(eval _2 := $(shell echo $(word 2,$(1)) | tr A-Z a-z))
$(dir $(_1))$(_2): $(_1)
	go generate $(_1)
endef

$(foreach s,$(stringer),$(eval $(call stringer_rule,$(subst >, ,$(s)))))
