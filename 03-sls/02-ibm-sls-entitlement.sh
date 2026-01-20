export ENTITLEDKEY="$(<../keyfiles/ibm-entitlement-key)"
export NAMESPACE="ibm-sls"
oc create secret docker-registry ibm-entitlement  --docker-server=cp.icr.io --docker-username=cp --docker-password=${ENTITLEDKEY} --namespace=${NAMESPACE}
