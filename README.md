# ruaccent_rolling
Альтернативные базы для ruaccent ( https://github.com/Den4ikAI/ruaccent )</br>
Цель: увеличить охват словарных замен, исправлять ошибки между релизами.

Файлы:</br>
ruaccent/dictionary/accent.json.gz    — словарь ударений</br>
ruaccent/dictionary/yo_words.json.gz  — словарь 'зеленый' --> 'зел+ёный' (и 'зелёный' --> 'зел+ёный')</br>
ruaccent/dictionary/rules_engine/accents.json  — правила обработки омографов по грамматическому признаку

Перед заменой, сделайте бэкап оригинальных файлов.

Альтернативные базы ударений генерируются автоматически скриптом из фалов пакета tts-scripts с помощью конвертера в
директории converter. Исходные файлы берутся тут: https://github.com/Balamoote/tts-scripts
