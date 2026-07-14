COMMAND_NAME = tuicl
SCRIPT_SRC = tui_clipboard.sh
BIN_DIR = $(HOME)/.local/bin


.PHONY: help install uninstall

help: ## Show available commands and their descriptions
	@awk 'BEGIN {FS = ":.*## "; printf "Usage: make <command>\n\nAvailable commands:\n"} /^[a-zA-Z_-]+:.*## / {printf "  %-12s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install tuicl to ~/.local/bin
	@mkdir -p $(BIN_DIR)
	ln -sf "$(shell pwd)/$(SCRIPT_SRC)" "$(BIN_DIR)/$(COMMAND_NAME)"
	chmod +x "$(SCRIPT_SRC)"

uninstall: ## Remove tuicl from ~/.local/bin
	rm -f "$(BIN_DIR)/$(COMMAND_NAME)"
