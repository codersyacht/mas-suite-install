eval $(crc oc-env)

oc patch deployment sls-api-licensing  -n ibm-sls  --type='json'  -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/startupProbe/initialDelaySeconds", "value": 240}, {"op": "replace", "path": "/spec/template/spec/containers/0/startupProbe/timeoutSeconds", "value": 240}]'
