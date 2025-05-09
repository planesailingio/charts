publish:
	# helm repo index . --url https://charts.planesailing.io
	git add . && \
		git commit -m'updated charts' && \
		git push