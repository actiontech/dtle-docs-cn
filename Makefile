default: gitbook_build publish
publish: publish_prepare publish_push

gitbook_preview:
	gitbook serve
gitbook_build:
	gitbook build

pdf:
	gitbook pdf ./ ./dble-manual.pdf

install:
	npm install -g gitbook-cli
	gitbook install

publish_prepare:
	git checkout gh-pages
	git pull origin gh-pages --rebase
	cp -R _book/* . || true
	git clean -fx node_modules
	git clean -fx _book
	git add .
	git commit -a -m "Update docs"

publish_push:
	git push origin gh-pages
	git checkout master
