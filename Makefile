PREVIOUS_FILE_PATH := ./assets/previous-links.txt
SAVE_TO := ./assets/current-links.txt

check:
	git clone https://github.com/perl6/doc
	perl6 -Ilib check.pm6 $(PREVIOUS_FILE_PATH) $(SAVE_TO)
	rm -rf ./doc/