echo "Are you installed 'nano'?"
cat << 'EOF' | sudo tee /usr/bin/wx
#!/bin/sh
f="$1"
shift
while true; do
  nano "$f"
  clear
  case "${f##*.}" in
    "sh") sh "$f" "$@" ;;
    "c") if gcc "$f" -o "${f%.*}"; then
      ./"${f%.*}" "$@"
    fi ;;

  esac
  echo "[Enter/Ctrl+C]"
  read -r _ < /dev/tty
done
EOF
sudo chmod +x /usr/bin/wx

