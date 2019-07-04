.PHONY: minikube
minikube:
	minikube start --memory=24288 --cpus=6 --disk-size 50g
	$(MAKE) addons

.PHONY: addons
addons:
	minikube addons enable metrics-server
	minikube addons enable registry

.PHONY: clean
clean:
	minikube delete
