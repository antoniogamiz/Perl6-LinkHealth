PREVIOUS_FILE_PATH := ./assets/previous-links.txt
SAVE_TO := ./assets/current-links.txt
LOCAL_PREVIOUS_FILE := ../mini-doc/previous-links.txt
LOCAL_DOC_PATH := ../mini-doc/test-doc
LOCAL_SAVE_TO := ../mini-doc/current-links.txt

check:
	git clone https://github.com/perl6/doc
	perl6 -Ilib check.pm6 ./doc/doc $(PREVIOUS_FILE_PATH) $(SAVE_TO)
	rm -rf ./doc/

check-local:
	perl6 -Ilib check.pm6 $(LOCAL_DOC_PATH) $(LOCAL_PREVIOUS_FILE) $(LOCAL_SAVE_TO)