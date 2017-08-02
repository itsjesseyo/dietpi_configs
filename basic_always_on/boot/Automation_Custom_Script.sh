#enable colors
cp -a /etc/skel/.??* ~/
#case insensitive tab completion
echo 'set completion-ignore-case On' >> /etc/inputrc
#disable all hibernation adn sleep - needs to go in bashrc mayb
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
#need to remove serial from cmd.txt and add consoleblank=0 to end of cmd.txt to disable monitor sleep
sed -i '1s/.*/dwc_otg.lpm_enable=0 console=tty1 root=PARTUUID=ee614650-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait consoleblank=0/' /boot/cmdline.txt 
#adding some additional power down methods - to cover bases for future
sed -i 's/BLANK_TIME=[0-9]*/BLANK_TIME=0/' /etc/kbd/config
sed -i 's/BLANK_DPMS=on/BLANK_DPMS=off/' /etc/kbd/config 
sed -i 's/POWERDOWN_TIME=[0-9]*/POWERDOWN_TIME=0/' /etc/kbd/config 
#need to install color - that turned out to be a force-colors settings in cdm, or boot or osmething

#optional, but this will hack the screen setting to be 1920 on next boot without having to type anything extra in
sed -i 's/framebuffer_width=[0-9]*/framebuffer_width=1920/' /DietPi/config.txt
sed -i 's/framebuffer_height=[0-9]*/framebuffer_height=1080/' /DietPi/config.txt
