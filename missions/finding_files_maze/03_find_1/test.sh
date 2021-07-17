#!/bin/sh

gsh assert check false

(
  cd "$(eval_gettext '$GSH_HOME/Garden/Maze')"

  find . -iname "*$(gettext "gold_coin")*" -type f | xargs rm -rf
  gsh assert check false

  find . -iname "*$(gettext "gold_coin")*" -type f | xargs rm -rf
  echo "coin" > "$(eval_gettext '$GSH_HOME/Garden/Maze')/gold_coin"
  gsh assert check false

  find . -iname "*$(gettext "gold_coin")*" -type f -exec mv "{}" "$GSH_CHEST" \;
  gsh assert check true
)