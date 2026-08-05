#!/bin/bash
# Script para crear los 13 usuarios en Firebase Auth
# Ejecutar: bash create-users.sh

API_KEY="AIzaSyAGO9kVQjMu9cHLD9U-DIsFq-z-NtCrqvk"
PASSWORD="encuentro123"

USERS=(
  "encuentrotambores"
  "agbaraimo"
  "chichayrон"
  "odara"
  "milmandalas"
  "toqueafro"
  "brincadeira"
  "sambamarta"
  "algoritmo"
  "revuelta"
  "santacadencia"
  "vibra"
  "estacatto"
)

for USER in "${USERS[@]}"; do
  EMAIL="${USER}@encuentrotambores.app"
  echo -n "Creando $EMAIL ... "
  
  RESPONSE=$(curl -s -X POST \
    "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${API_KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"email\":\"${EMAIL}\",\"password\":\"${PASSWORD}\",\"returnSecureToken\":true}")
  
  if echo "$RESPONSE" | grep -q "localId"; then
    echo "✅ OK"
  else
    ERROR=$(echo "$RESPONSE" | grep -o '"message":"[^"]*"' | head -1)
    echo "⚠️  $ERROR"
  fi
done

echo ""
echo "¡Listo! Todos los usuarios creados."
