deploy:
	middleman build && git subtree push --prefix build origin gh-pages