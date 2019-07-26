namespace:
	kubectl get ns | grep -q $(NAMESPACE)

.PHONY: roullete
roullete: namespace
	helm template roullete --name roullete | kubectl apply -n $(NAMESPACE) -f -

delete:
	helm template roullete --name roullete | kubectl delete -n $(NAMESPACE) -f -

INGRESS_HOST=$(shell minikube ip)
INGRESS_PORT=$(shell kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
SECURE_INGRESS_PORT=$(shell kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')

test:
	@curl -X POST -HHost:bet.app-roullete-dev.minikube http://$(INGRESS_HOST):$(INGRESS_PORT)/api/v1/bet/ -d '{}' -H "Content-Type: application/json"
	@curl -X POST -HHost:bet.app-roullete-dev.minikube http://$(INGRESS_HOST):$(INGRESS_PORT)/api/v1/bet/ -d '{"user": "n0npax", "field": 11, "amount": 33}' -H "Content-Type: application/json"
	@curl -X POST -HHost:spin.app-roullete-dev.minikube http://$(INGRESS_HOST):$(INGRESS_PORT)/api/v1/spin/

