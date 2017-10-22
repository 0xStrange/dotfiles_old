BASE_DIR=$(shell pwd)

.PHONY: all
all: bash mc xorg xterm

.PHONY: bash
bash: ${HOME}/.bashrc ${HOME}/.bashrc.d/.keep bash.prompt

${HOME}/.bashrc: ${BASE_DIR}/.bashrc
	install -D -m 640 $< $@

${HOME}/.bashrc.d/.keep: ${BASE_DIR}/.bashrc.d/.keep
	install -D -m 640 $< $@

.PHONY: bash.prompt
bash.prompt: ${HOME}/.bashrc.d/01-prompt.sh

${HOME}/.bashrc.d/01-prompt.sh : ${BASE_DIR}/.bashrc.d/01-prompt.sh
	install -D -m 750 $< $@

.PHONY: mc
mc: mc.bash

.PHONY: mc.bash
mc.bash: bash ${HOME}/.bashrc.d/00-mc.sh

${HOME}/.bashrc.d/00-mc.sh : ${BASE_DIR}/.bashrc.d/00-mc.sh
	install -D -m 750 $< $@

.PHONY: xorg
xorg: ${HOME}/.xinitrc ${HOME}/.xinitrc.d/.keep

${HOME}/.xinitrc : ${BASE_DIR}/.xinitrc
	install -D -m 640 $< $@

${HOME}/.xinitrc.d/.keep : ${BASE_DIR}/.xinitrc.d/.keep
	install -D -m 640 $< $@

.PHONY: xorg.xresources
xorg.xresources: ${HOME}/.xinitrc.d/00-load-xresources.sh ${HOME}/.Xresources.d/.keep

${HOME}/.xinitrc.d/00-load-xresources.sh: ${BASE_DIR}/.xinitrc.d/00-load-xresources.sh
	install -D -m 750 $< $@

${HOME}/.Xresources.d/.keep: ${BASE_DIR}/.Xresources.d/.keep
	install -D -m 640 $< $@

.PHONY: xterm
xterm: xorg.xresources ${HOME}/.Xresources.d/xterm.Xresources

${HOME}/.Xresources.d/xterm.Xresources: ${BASE_DIR}/.Xresources.d/xterm.Xresources
	install -D -m 640 $< $@
