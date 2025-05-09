publish:
	helm repo index . --url https://charts.planesailing.io
	cd ../planesailingio-charts && \
		git add . && \
		git commit -m'updated charts' && \
		git push