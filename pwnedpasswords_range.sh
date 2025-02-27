#!/bin/sh

# sh pwnedpasswords-range.sh

printf "\e[1;33m   Small and simple bash script to check if your password is contained in known breaches. \e[0m\n"
printf "\e[1;33m   First your password will be hashed locally. The first 5 characters of the hash will be sent to \e[0m\n"
printf "\e[1;32m https://api.pwnedpasswords.com/range/hash_fragment \e[0m\n"
printf "\e[1;33m   This way, you are never sending anything secret around the internet. That would be a no-no. \e[0m\n"
printf "\e[1;33m   Read more here: \e[0m\n"
printf "\e[1;32m https://www.troyhunt.com/understanding-have-i-been-pwneds-use-of-sha-1-and-k-anonymity/ \e[0m\n"
printf "\e[1;33m   The service will return a list of hashes that start with the fragment. This is pretty innocuous. \e[0m\n"
printf "\e[1;33m   If your hash is in this list, bad luck, Oh no - you are pwned!  \e[0m\n"
printf "\e[1;33m   Change your password and don't reuse it ever again. It is a bad compromised password.  \e[0m\n"
printf "\n"

printf "\e[1;34m Input the password (for privacy it will not appear on the screen): \e[0m\n"
stty -echo
printf  "\e[1;34m Is it pwned?  \e[0m"
read -r PASSWORD
stty echo
printf "\n"

printf "\e[1;33m   calculate SHA-1 checksum for password \e[0m\n"
PWDSHASUM=$(printf %s "$PASSWORD" | shasum)

printf "\e[1;33m   split SHA-1 sum into prefix (for API call) and suffix \e[0m\n"
SHASUM_PREFIX=$(printf $PWDSHASUM | cut -c1-5 | awk '{print toupper($0)}')
SHASUM_SUFFIX=$(printf $PWDSHASUM | cut -c6-40 | awk '{print toupper($0)}')

printf "\e[1;33m   query HIBP API with prefix & check if suffix is in response \e[0m\n"
RESULT=$(curl -s https://api.pwnedpasswords.com/range/$SHASUM_PREFIX | grep $SHASUM_SUFFIX)

printf "\e[1;33m   check if suffix is in API response \e[0m\n"
if [ ${#RESULT} -ge 36 ]; then
  printf "\e[1;33m   extract occurrence from result \e[0m\n"
  PWND_TIMES=$(printf $RESULT | cut -c37- | xargs)
  printf "\e[1;33m   remove last character \e[0m\n"
  printf "\n"
  printf "\e[1;31m Oh no - you are pwned! This password has been seen several times: %s \e[0m\n" "$PWND_TIMES"
  printf "\n"
  exit 1
else
  printf "\n"
  printf "\e[1;32m Password not pwned. - This is not a guarantee that it is a good password. \e[0m\n"
  printf "\n"
fi
