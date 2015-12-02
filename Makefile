# Determine platform name and perform OS-specific dependency checks
platform=$(shell uname)

all: dependencies test

test:
	npm test

dependencies:
	@(which node >/dev/null || echo "make: ***" STOP: node.js not found) || true
	@(which node >/dev/null || echo "make: ***" node.js must be installed prior to using this kata-seed) || true

	@[ '$(platform)' = 'Darwin' ] && (which node >/dev/null || (which brew >/dev/null && echo "make: ***" You can use \`brew install node\' on OSX to install node.js)) || true
	@[ '$(platform)' = 'Darwin' ] && (which node >/dev/null || (which brew >/dev/null || echo "make: ***" To install on OSX, first install homebrew \(http://brew.sh/\) then you can use \`brew install node\')) || true

	@(which node >/dev/null || echo "make: ***" After installing node, please run \`make\' again) || true
	@which node >/dev/null 	# fail silently if node does not exist (but first present information)
	npm install phantomjs
	npm install

.PHONY: all dependencies test
