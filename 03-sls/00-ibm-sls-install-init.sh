host_name=$(hostname)
echo ${host_name}

printf '%s\n' '/domain: /' d i '  domain: '${host_name} . w q | ed -s 06-ibm-sls.yaml
printf '%s\n' '/host: /' d i '      - host: '${host_name} . w q | ed -s 06-ibm-sls.yaml

cp /etc/ssl/mongo/mongodb-cert.crt ../keyfiles/mongo.crt

ed -s "06-ibm-sls.yaml" <<EOF
g/          -----BEGIN CERTIFICATE-----/.,\$d
w
q
EOF

indentation="          " 
sed "s/^/$indentation/" "../keyfiles/mongo.crt" >> "06-ibm-sls.yaml"
