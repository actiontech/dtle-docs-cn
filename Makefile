default: gitbook_build publish gitbook_pdf
publish: publish_prepare publish_push

gitbook_preview:
	docker run --rm -v "${PWD}":/gitbook -p 4000:4000 billryan/gitbook:zh-hans gitbook serve
gitbook_build:
	docker run --rm -v "${PWD}":/gitbook -p 4000:4000 billryan/gitbook:zh-hans gitbook build

gitbook_pdf:
	docker run --rm -v "${PWD}":/gitbook -p 4000:4000 billryan/gitbook:zh-hans gitbook pdf ./ ./dtle-manual.pdf
	git add .
	git commit -a -m "Update pdf"
	git push

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
