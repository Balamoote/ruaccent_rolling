#!/bin/bash
# Конвертер файлов из пакета https://github.com/Balamoote/tts-scripts в JSON формат
# Использование:
# 1) поместите файлы, указанные ниже в одну директорию с этим скриптом и скриптом ruac_gen_dics.awk
# 2) запустите bash-скрипт: ./join_dics.sh

dix_path="dictionary/"

if [[ -d "$dix_path" ]]; then rm -rf "$dix_path"; mkdir "$dix_path"; else mkdir "$dix_path"; fi

# Пропускаем файлы с ударениям через скрпит создания JSON
zcat unistress.gz unistrehy.gz uniomo.gz namebase.gz yodef.gz yodhy.gz yoyo.gz yoyo_lc.gz unis_ruac.gz |\
  awk -vdix_path="$dix_path" -f ruac_gen_dics.awk

