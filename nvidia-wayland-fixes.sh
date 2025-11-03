# Read https://www.reddit.com/r/kde/comments/13e02dl/how_to_fix_the_sleepsuspend_issueglitch_with/ for more info about this script or adjustments depending on your Distro

sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1" | sudo tee -a /lib/modprobe.d/systemd.conf > /dev/null

case "$(whoami)" in
  root) PRIVILEGES="" ;;
  *) PRIVILEGES="sudo" ;;
esac

if which apt &> /dev/null; then
    $PRIVILEGES apt-get install --reinstall linux-image-$(uname -r)
else
    echo "Package manager not supported. Please read the reddit thread how YOUR pkg-mgr should perform this action, otherwise you will end up with a broken system."
fi
