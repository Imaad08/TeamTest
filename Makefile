# Configuration, override port with usage: make PORT=4300
PORT ?= 4200
REPO_NAME ?= student
LOG_FILE = /tmp/jekyll$(PORT).log
# Exceptions will stop make
SHELL = /bin/bash
# .SHELLFLAGS = -e

# Phony Targets, makefile housekeeping for below definitions
.PHONY: default server convert clean stop

# List all .ipynb files in the _notebooks directory
NOTEBOOK_FILES := $(wildcard _notebooks/*.ipynb)

# Specify the target directory for the converted Markdown files
DESTINATION_DIRECTORY = _posts
MARKDOWN_FILES := $(patsubst _notebooks/%.ipynb,$(DESTINATION_DIRECTORY)/%_IPYNB_2_.md,$(NOTEBOOK_FILES))

# Call server, then verify and start logging
# ...

# Call server, then verify and start logging
default: server
	@echo "Terminal logging starting, watching server..."
	@# tail and awk work together to extract Jekyll regeneration messages
	@# When a _notebook is detected in the log, call make convert in the background
	@# Note: We use the "if ($$0 ~ /_notebooks\/.*\.ipynb/) { system(\"make convert &\") }" to call make convert
	@(tail -f $(LOG_FILE) | awk '/Server address: http:\/\/127.0.0.1:$(PORT)\/$(REPO_NAME)\// { serverReady=1 } \
	serverReady && /^ *Regenerating:/ { regenerate=1 } \
	regenerate { \
		if (/^[[:blank:]]*$$/) { regenerate=0 } \
		else { \
			print; \
			if ($$0 ~ /_notebooks\/.*\.ipynb/) { system("make convert &") } \
		} \
	}') 2>/dev/null &
	@# start an infinite loop with timeout to check log status
	@for ((COUNTER = 0; ; COUNTER++)); do \
		if grep -q "Server address:" $(LOG_FILE); then \
			echo "Server started in $$COUNTER seconds"; \
			break; \
		fi; \
		if [ $$COUNTER -eq 60 ]; then \
			echo "Server timed out after $$COUNTER seconds."; \
			echo "Review errors from $(LOG_FILE)."; \
			cat $(LOG_FILE); \
			exit 1; \
		fi; \
		sleep 1; \
	done
	@# outputs startup log, removes last line ($$d) as ctl-c message is not applicable for background process
	@sed '$$d' $(LOG_FILE)



# Start the local web server
server: stop convert
	@echo "Starting server..."
	@@nohup bundle exec jekyll serve -H 127.0.0.1 -P $(PORT) > $(LOG_FILE) 2>&1 & \
		PID=$$!; \
		echo "Server PID: $$PID"
	@@until [ -f $(LOG_FILE) ]; do sleep 1; done


# Convert .ipynb files to Markdown with front matter
convert: $(MARKDOWN_FILES)
	
# Convert .md file, if .ipynb file is newer
$(DESTINATION_DIRECTORY)/%_IPYNB_2_.md: _notebooks/%.ipynb
	@echo "Converting source $< to destination $@"
	@python -c 'import sys; from scripts.convert_notebooks import convert_single_notebook; convert_single_notebook(sys.argv[1])' "$<"

# Clean up project derived files, to avoid run issues stop is dependency
clean: stop
	@echo "Cleaning converted IPYNB files..."
	@@rm -f _posts/*_IPYNB_2_.md
	@rm -rf _site


# Stop the server and kill processes
stop:
	@echo "Stopping server..."
	@# kills process running on port $(PORT)
	@@lsof -ti :$(PORT) | xargs kill >/dev/null 2>&1 || true
	@echo "Stopping logging process..."
	@# kills previously running logging processes
	@@ps aux | awk -v log_file=$(LOG_FILE) '$$0 ~ "tail -f " log_file { print $$2 }' | xargs kill >/dev/null 2>&1 || true
	@# removes log
	@rm -f $(LOG_FILE)
