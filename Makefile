default: gitbook_build publish
publish: publish_prepare publish_push

gitbook_install:
	gitbook install
gitbook_preview: gitbook_install
	gitbook serve
gitbook_build: gitbook_install
	gitbook build

pdf:
	gitbook pdf ./ ./dtle-manual.pdf

install:
	npm install -g gitbook-cli
	gitbook install

publish_prepare:
	git checkout gh-pages
	git pull origin gh-pages --rebase
	cp -R _book/* . || true
#	git clean -f node_modules
	git clean -fx _book
	git add .
	git commit -a -m "Update docs"

publish_push:
	git push origin gh-pages
	git checkout master
