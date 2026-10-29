cat << 'EOF' | sudo tee /usr/bin/lightctl
#!/bin/bash

dir=/sys/class/backlight/intel_backlight
max=$(cat $dir/max_brightness)
cur=$(cat $dir/brightness)
new=${1:-}

if [[ -n $new ]]; then
  echo $(($max / 100 * $new)) |
	sudo tee $dir/brightness \
	> /dev/null
else
  echo $(($cur * 100 / $max))
fi
EOF
sudo chmod +x /usr/bin/lightctl

