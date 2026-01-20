export MASREGKEY="$(<../keyfiles/sls-registration-key)"
oc create secret generic sls-registration-key --from-literal=registrationKey=${MASREGKEY} -n mas-max-core
