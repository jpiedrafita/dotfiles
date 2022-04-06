<img align="center" src="https://raw.githubusercontent.com/TheodoreBellas/Conky-SideBar/master/Sidebar-Conky_Rc.png" alt="Conky-Sidebar Image">

# Conky-SideBar
This is a small system monitor written for Conky that I found on DeviantArt (source below) and modified to better suit my needs as a Linux Mint 18.2 user.


# Original Version

The original version is here: https://wim66.deviantart.com/art/Sidebar-Conky-screen-size-1920x1080-535485928   (many thanks to wim66!)

I modified this a little bit to work better with Linux Mint 18.2 with the Cinnamon desktop, but with a little know-how
you should be able to do the same to fit whatever desktop manager you're using.

It's fully transparent and currently in "panel" mode, so it takes up its own dedicated space on the desktop, 
but you can change this by changing the "own_window_type" property to "normal", "desktop", or "override".

Play with it a little and see what suits you best!

# Fonts

The fonts used for this are included in the INSTALL_FONTS directory (Adele and Adele Bold, for reference).

# Modifications

I removed the large calendar it originally came with, as well as all of the weather functionality.
I also changed the Network section to point to my dedicated ethernet interface (on Ubuntu 16.04 or newer it should be named "enp0s25").
If that's not the case for you, simply open the RC file and change "enp0s25" to whatever your interface name is.

There's also some support for wireless signal strength that I commented out, but left in for others to use if necessary.

The graphs have been sized down a little (I was running this on a 1600x900 screen), and some of the section titles
have been positionally changed and bolded for clarity. 

The original CPU graphs only contained entries for dual-core processors, I updated it such that 4 CPU's are shown. If you're running 
a dual-core processor, I'd suggest you comment out the section marked as "third and fourth CPU cores" (or upgrade your processor, jeez).

# Setup
```bash
cd /tmp/
git clone https://github.com/TheodoreBellas/Conky-SideBar
cd Conky-SideBar
cp INSTALL_FONTS/* ~/.fonts/
mkdir -p ~/.conky
cp Sidebar-Conky_Rc ~/.conky
cd ..
rm -rf /tmp/Conky-SideBar
#
net_device=$(ip addr | awk '/state UP/ {print $2}' | sed 's/.$//')
sed -i "s/enp0s25/${net_device}/g" $HOME/.conky/Sidebar-Conky_Rc
```

# Start
```bash
conky -q -c ~/.conky/Sidebar-Conky_Rc &
```