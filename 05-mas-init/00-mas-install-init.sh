host_name=$(hostname)
echo ${host_name}

oc get secret sls-cert-ca -n ibm-sls -o jsonpath="{.data['ca\.crt']}" | base64 -d > ../keyfiles/sls.crt

echo "sls certificate copied"

oc get LicenseService sls -n ibm-sls  -o jsonpath="{.status.registrationKey}" > ../keyfiles/sls-registration-key

echo "Registration key copied"

printf '%s\n' '/url: /' d i '    url: https://sls.ibm-sls.'${host_name} . w q | ed -s 06-slsCfg.yaml

ed -s "06-slsCfg.yaml" <<EOF
g/          -----BEGIN CERTIFICATE-----/.,\$d
w
q
EOF

indentation="          " 
sed "s/^/$indentation/" "../keyfiles/sls.crt" >> "06-slsCfg.yaml"


printf '%s\n' '/host: /' d i '      - host: '${host_name} . w q | ed -s 08-MongoCfg.yaml

ed -s "08-MongoCfg.yaml" <<EOF
g/          -----BEGIN CERTIFICATE-----/.,\$d
w
q
EOF

indentation="          " 
sed "s/^/$indentation/" "../keyfiles/mongo.crt" >> "08-MongoCfg.yaml"


printf '%s\n' '/url: /' d i '    url: jdbc:db2://'${host_name}':50000/MAXIMO' . w q | ed -s 10-JdbcCfg.yaml

printf '%s\n' '/domain: /' d i '  domain: '${host_name} . w q | ed -s 11-MasInstall.yaml
