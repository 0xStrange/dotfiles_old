.PHONY: all
.PHONY: bash

BASHRC_D_TARGET_FILES= $(addprefix ${HOME}/,$(shell ls .bashrc.d/*.sh))

all: bash

bash: ${HOME}/.bashrc $(BASHRC_D_TARGET_FILES)

${HOME}/.bashrc: ./.bashrc
	install -m 640 $< $@

${HOME}/.bashrc.d/%.sh: ./.bashrc.d/%.sh
	install -D -m 640 $< $@