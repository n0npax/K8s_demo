namespace:
	kubectl get ns | grep -q $(NAMESPACE)

.PHONY: roullete
roullete: namespace
	helm template roullete --name roullete | kubectl apply -n $(NAMESPACE) -f -

delete:
	helm template roullete --name roullete | kubectl delete -n $(NAMESPACE) -f -


test:
	@curl  -HHost:roullete-random-field.app-roullete-dev.minikube http://$$INGRESS_HOST:$$INGRESS_PORT/api/v1/random/field/
	@curl -X POST  -HHost:roullete-bet.app-roullete-dev.minikube http://$$INGRESS_HOST:$$INGRESS_PORT/api/v1/bet/ -d '{}' -H "Content-Type: application/json"
	@curl -X POST -HHost:roullete-spin.app-roullete-dev.minikube http://$$INGRESS_HOST:$$INGRESS_PORT/api/v1/spin/

