#!/bin/bash

dix_path="dictionary/"

if [[ -d "$dix_path" ]]; then rm -rf "$dix_path"; mkdir "$dix_path"; else mkdir "$dix_path"; fi

zcat unistress.gz unistrehy.gz uniomo.gz namebase.gz yodef.gz yodhy.gz yoyo.gz yoyo_lc.gz unis_ruac.gz |\
  awk -vdix_path="$dix_path" -f ruac_gen_dics.awk

