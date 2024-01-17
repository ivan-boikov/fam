INSTALL_DIR = "$(HOME)/.local/bin"
FILES = bibtex-to-meta cached-curl doi-grep doi-infer doi-rename doi-repair doi-to-bibtex

install: $(foreach f, $(FILES), link-$(f))

uninstall: $(foreach f, $(FILES), unlink-$(f))

link-%: %
#@echo "SYM $< => $(INSTALL_DIR)/$<"
	@ln -snfv $(CURDIR)/$< $(INSTALL_DIR)/$<

unlink-%: %
#@echo "Remove Symlink $(INSTALL_DIR)/$<"
	@$(RM) -v $(INSTALL_DIR)/$<
