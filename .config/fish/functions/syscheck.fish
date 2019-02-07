function syscheck -d "Check for errors and clean pacman"
  echo ""
  echo "###"
  echo "### Failed systemd services..."
  echo "###"
  echo ""
  sudo systemctl --failed

  echo ""
  echo "###"
  echo "### Errors in logfiles..."
  echo "###"
  echo ""
  sudo journalctl -p 3 -xb --no-pager

  echo ""
  echo "###"
  echo "### Removing orphan packages..."
  echo "###"
  echo ""
  sudo pacman -Rns (pacman -Qtdq)

  echo ""
  echo "###"
  echo "### Clear pacman cache..."
  echo "###"
  echo ""
  sudo paccache -r
  sudo paccache -ruk0
end
