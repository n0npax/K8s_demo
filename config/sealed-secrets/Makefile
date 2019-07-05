cert.pem:
	kubeseal --fetch-cert --controller-namespace sealed-secrets --controller-name sealed-secrets > cert.pem

secret: cert.pem
	kubectl create secret generic $(NAME) --dry-run --from-literal=$(KEY)=$(VALUE) -o yaml -n $(NAMESPACE) | kubeseal --format yaml --cert cert.pem | tee $(KEY)-$(NAME)-$(NAMESPACE).yaml | kubectl apply -f -
