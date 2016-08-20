#-- Setup the current repository by installing required gems.
setup:
	bundle install

#-- Start development server
dev:
	middleman server

#-- Build production slides into the /build folder
build:
	middleman build

#-- deploy to gh-pages
deploy:
	git subtree push --prefix build origin gh-pages