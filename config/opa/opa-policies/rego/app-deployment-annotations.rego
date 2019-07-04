package kubernetes.admission

import data.kubernetes.namespaces

import input.request.object.metadata.annotations as annotations


deny[msg] {
	input.request.kind.kind == "Deploymeent"
	startswith(input.request.namespace, "app")
	check_annotations(annotations)
	msg := "Please use ReplicaSet instead of Deployment in the apps namespaces"
}

check_annotations(a) {
	a["skip-opa"] == "true"
}
