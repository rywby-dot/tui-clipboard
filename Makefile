COMMAND_NAME = tuicl
SCRIPT_SRC = tui_clipboard.sh
BIN_DIR = $(HOME)/.local/bin
.PHONY: install uninstall
install:
	@mkdir -p $(BIN_DIR)
	ln -sf "$(shell pwd)/$(SCRIPT_SRC)" "$(BIN_DIR)/$(COMMAND_NAME)"
	chmod +x "$(SCRIPT_SRC)"
uninstall:
	rm -f "$(BIN_DIR)/$(COMMAND_NAME)"
