#!/bin/bash
# script to get kubectl and minikube

set -eux

echo "~~~
Script based on instructions in:
    * https://kubernetes.io/docs/tasks/tools/install-kubectl/
    * https://kubernetes.io/docs/tutorials/hello-minikube/

After install look at hello-minikube for usage instructions.
~~~

"

# fail if not ubuntu
cat /etc/os-release  | grep -q -i ubuntu

if ! which kubectl > /dev/null; then
	stable=`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
	echo "getting kubectl $stable"
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$stable/bin/linux/amd64/kubectl
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
else
	echo "NOTE: kubectl installed."
fi

if ! which minikube > /dev/null; then
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
	sudo dpkg -i minikube_latest_amd64.deb
else
	echo "NOTE: minikube installed."
fi
