all: dependencies test

test:
	npm test

dependencies:
	@(which node >/dev/null || echo "make: ***" STOP: node.js not found) || true
	@(which node >/dev/null || echo "make: ***" node.js must be installed prior to using this kata-seed) || true
	@(which node >/dev/null || (which brew >/dev/null && echo "make: ***" You can use \`brew install node\' on OS to install node.js)) || true
	@(which node >/dev/null || (which brew >/dev/null || echo "make: ***" To install on OS, first install homebrew \(http://brew.sh/\) then you can use \`brew install node\')) || true
	@(which node >/dev/null || echo "make: ***" After installing node, please run \`make\' again) || true
	which node >/dev/null && npm install phantomjs
	npm install

.PHONY: all dependencies test
