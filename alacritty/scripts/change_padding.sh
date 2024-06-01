#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <x> <y>"
  exit 1
fi

# Параметры padding
x_padding=$1
y_padding=$2

# Путь к файлу конфигурации
config_file="$HOME/.config/alacritty/alacritty.toml"

# Проверка существования файла конфигурации
if [ ! -f "$config_file" ]; then
  echo "Config file not found: $config_file"
  exit 1
fi

# Изменение значения padding
sed -i "s/padding = { x = [0-9]*, y = [0-9]* }/padding = { x = $x_padding, y = $y_padding }/" "$config_file"

echo "Padding set to: x = $x_padding, y = $y_padding"

