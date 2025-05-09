publish:
	# helm repo index . --url https://charts.planesailing.io
	git add . && \
		git commit -m'updated charts'
	git push

.SILENT: get-nvidia-operator-images
get-nvidia-operator-images:
	helm show values nvidia/gpu-operator > out.yaml
	yq eval -P '.validator | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.operator | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.operator.initContainer | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.driver | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.driver.manager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.toolkit | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.devicePlugin | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.dcgm | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.dcgmExporter | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.gfd | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.migManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.nodeStatusExporter | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.gds | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.gdrcopy | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.vgpuManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.vgpuManager.driverManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.vgpuDeviceManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.vfioManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.vfioManager.driverManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.kataManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.sandboxDevicePlugin | .repository + "/" + .image  + ":" + .version' ./out.yaml
	yq eval -P '.ccManager | .repository + "/" + .image  + ":" + .version' ./out.yaml
	rm ./out.yaml

rendered-nvidia-operator-images:
	docker.io/planesailingio/nvidia-cuda:12.8.1-base-ubi9
	docker.io/planesailingio/nvidia-driver:570.124.06
	docker.io/planesailingio/nvidia-cloud-native-k8s-driver-manager:v0.8.0
	docker.io/planesailingio/nvidia-k8s-container-toolkit:v1.17.5-ubuntu20.04
	docker.io/planesailingio/nvidia-k8s-device-plugin:v0.17.1
	docker.io/planesailingio/nvidia-cloud-native-dcgm:4.1.1-2-ubuntu22.04
	docker.io/planesailingio/nvidia-k8s-dcgm-exporter:4.1.1-4.0.4-ubuntu22.04
	docker.io/planesailingio/nvidia-k8s-device-plugin:v0.17.1
	docker.io/planesailingio/nvidia-cloud-native-k8s-mig-manager:v0.12.1-ubuntu20.04
	docker.io/planesailingio/nvidia-cloud-native-nvidia-fs:2.20.5
	docker.io/planesailingio/nvidia-cloud-native-gdrdrv:v2.4.4
	docker.io/planesailingio/nvidia-cloud-native-k8s-driver-manager:v0.8.0
	docker.io/planesailingio/nvidia-cloud-native-vgpu-device-manager:v0.3.0
	docker.io/planesailingio/nvidia-cuda:12.8.1-base-ubi9
	docker.io/planesailingio/nvidia-cloud-native-k8s-driver-manager:v0.8.0
	docker.io/planesailingio/nvidia-cloud-native-k8s-kata-manager:v0.2.3
	docker.io/planesailingio/nvidia-kubevirt-gpu-device-plugin:v1.3.1
	docker.io/planesailingio/nvidia-cloud-native-k8s-cc-manager:v0.1.1