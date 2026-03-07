export ENTITLEDKEY="$(<../keyfiles/ibm-entitlement-key)"
export NAMESPACE="ibm-software-central"
oc create secret docker-registry ibm-entitlement-key  --docker-server=cp.icr.io --docker-username=cp --docker-password=${ENTITLEDKEY} --namespace=${NAMESPACE}
