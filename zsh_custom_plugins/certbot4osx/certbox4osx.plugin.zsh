#!/bin/zsh

# Use certbot brewed version

insert_into_keychain() {
  openssl pkcs12 -export -inkey /etc/letsencrypt/live/$1/privkey.pem -in /etc/letsencrypt/live/$1/cert.pem -certfile /etc/letsencrypt/live/$1/fullchain.pem -out /etc/letsencrypt/live/$1/letsencrypt_sslcert.p12 -passout pass:topsecret
  SHA_NEW=`openssl pkcs12 -in  /etc/letsencrypt/live/$1/letsencrypt_sslcert.p12 -nomacver -nodes -passin pass:topsecret | openssl x509 -noout -fingerprint -sha1 | cut -f2 -d'=' | sed 's/://g'`
  if [[ $2 != $SHA_NEW ]]; then
    # New certificate available
    # Import into keychain
    security import /etc/letsencrypt/live/$1/letsencrypt_sslcert.p12 -f pkcs12 -k /Library/Keychains/System.keychain -P topsecret -A
    if [ -n "$2" ]; then
      # Tell services to use new certificate
      certupdate replace -c /etc/certificates/$1.$2.cert.pem -C /etc/certificates/$1.$SHA_NEW.cert.pem

      # Delete old certificate
      security delete-certificate -Z $2 -t /Library/Keychains/System.keychain
    fi
  fi
}

if [ "$1" '==' 'renew' ]; then
  certbot renew
  for D in `find /etc/letsencrypt/live -mindepth 1 -type d -exec basename {} \;`
  do
      SHA=`openssl pkcs12 -in  /etc/letsencrypt/live/$D/letsencrypt_sslcert.p12 -nomacver -nodes -passin pass:topsecret | openssl x509 -noout -fingerprint -sha1 | cut -f2 -d'=' | sed 's/://g'`
      insert_into_keychain $D $SHA
  done
elif [ "$1" '==' 'new' ]; then
  certbot certonly --webroot -w $3 -d $2
  insert_into_keychain $2
else
  echo "Usage: certbot4osx renew|new [domain] [webroot]"
  exit 1
fi
