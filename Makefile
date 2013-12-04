TESTS = "test/**/*.js"
REPORTER = list
TIMEOUT = 10000
JSHINT = ./node_modules/.bin/jshint
MOCHA = ./node_modules/.bin/mocha

build: npm jshint

npm:
	@npm install

jshint:
	@$(JSHINT) .

test: npm
	@NODE_ENV=test $(MOCHA) \
		--bail \
        --reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		$(TESTS)

watch: npm
	@NODE_ENV=test $(MOCHA) \
		--bail \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--growl \
		--watch \
		$(TESTS)

.PHONY: test watch build npm jshint
