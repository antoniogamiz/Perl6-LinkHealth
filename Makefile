PREVIOUS_FILE_PATH ?= ./assets/previous-links.txt
CURRENT_FILE_PATH ?= ./assets/current-links.txt
LOCAL_DOC_PATH ?= ../mini-doc/test-doc

check:
	git clone https://github.com/perl6/doc
	perl6 -Ilib check.pm6 ./doc/doc $(PREVIOUS_FILE_PATH) $(SAVE_TO)
	rm -rf ./doc/

check-local:
	perl6 -Ilib check.pm6 $(LOCAL_DOC_PATH) $(PREVIOUS_FILE_PATH) $(CURRENT_FILE_PATH)
