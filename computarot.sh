#!/bin/bash


random() {
  random_number=$((0 + RANDOM % $1))
  echo ${random_number}
}


tarot() {
  echo " "
  echo "  Get in touch with universal spirit.."
  echo " "
  echo "  ⛎ ♈️ ♉️ ♊️ ♋️ ♌️ ♍️ ♎️ ♏️ ♐️ ♑️ ♒️ ♓️"
  echo " "
  sleep 1s
  echo "  Your Tarot Drawn for today:"
  echo " "

  req=$(curl -ss 'https://raw.githubusercontent.com/dariusk/corpora/master/data/divination/tarot_interpretations.json')

  card_number=$(random 78)

  card_name=`echo $req | jq --arg random "$card_number" '.["tarot_interpretations"] | .[$random|tonumber].name' | tr -d '"'`

  card=`echo $req | jq -r ".[\"tarot_interpretations\"] | .[] | select(.name==\"$card_name\")"`

  fortune_length=`echo $card | jq -r ".[\"fortune_telling\"] | length"`
  fortune_telling=`echo $card | jq -r ".[\"fortune_telling\"] | .[\"$(random $fortune_length)\"|tonumber]"`

  light_length=`echo $card | jq -r ".[\"meanings\"] | .[\"light\"] | length"`
  light_telling=`echo $card | jq -r ".[\"meanings\"] | .[\"light\"] | .[\"$(random $light_length)\"|tonumber]"`

  dark_length=`echo $card | jq -r ".[\"meanings\"] | .[\"shadow\"] | length"`
  dark_telling=`echo $card | jq -r ".[\"meanings\"] | .[\"shadow\"] | .[\"$(random $dark_length)\"|tonumber]"`

  keyword_length=`echo $card | jq -r ".[\"meanings\"] | length"`
  keyword_telling=`echo $card | jq -r ".[\"keywords\"] | .[\"$(random $keyword_length)\"|tonumber]"`

  sleep 1s
  printf "  🃏  :  ${card_name} \n
  👀  :  ${fortune_telling}\n
  🧠  :  ${light_telling}\n
  🔧  :  ${dark_telling}\n
  🔑  :  ${keyword_telling}"

  echo " "
  echo " "
  echo "  Have a Nice Day! ✌️ "
  echo " "
}


tarot
