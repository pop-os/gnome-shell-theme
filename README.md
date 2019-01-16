<p align="center">
<img src="https://github.com/system76/pop-gtk-theme/raw/master/Pop_gtk-logo.png"/>
</p>

-------------------

## The Pop GNOME Shell theme. 

This is the GNOME Shell theme that goes along with the [Pop GTK Theme](https://github.com/pop-os/gtk-theme).
It's built and managed separately so that changes in one don't necessarily
require building unrelated components. This also allows cleaner builds and 
easier maintenance.


### Required Components
-------------------
Pop GNOME Shell supports GNOME 3.18, 3.24, 3.26, and 3.28 
* GNOME-Shell     >= 3.18.3
* Pop GTK Theme*

 > **Note:**
 >
 >   * Pop GTK Theme isn't necessarily a requirement, but it is required to select the theme in tweak tool.



### Recommendations

- For GTK, use icons alongside [Pop Icon Theme](https://github.com/system76/pop-icon-theme)
- For fonts, use:
 > Window Titles: Fira Sans SemiBold 10

 > Interface: Fira Sans Book 10

 > Documents: Roboto Slab Regular 11

 > Monospace: Fira Mono Regular 11


### Installation

Pop is intended to be installed through your distribution package manager. 
```
sudo apt install pop-gnome-shell-theme
```

It's also recommended to restart the GNOME Shell after applying the theme of your choice.

Enter the Shell's command launcher
```
Alt + F2
```

This will restart the Shell after you hit Enter
```
r
```



### Installation from Git Source
----------------------------



1. If previous versions were installed/existed, remove them first.

 ```
 sudo apt remove system76-pop-gtk-theme
 sudo make uninstall
 sudo rm -rf /usr/share/themes/{Pop,Pop-Eta,Pop-Nokto,Pop-Nokto-Eta}
 rm -rf ~/.local/share/themes/{Pop,Pop-Eta,Pop-Nokto,Pop-Nokto-Eta}
 rm -rf ~/.themes/{Pop,Pop-Eta,Pop-Nokto,Pop-Nokto-Eta}
 ```

2. Install build dependencies

You can either try 
```
sudo apt build-dep pop-gnome-shell-theme
```

Or, use this to install all dependencies in one go:
```
sudo apt install sassc inkscape optipng libglib2.0-dev-bin
```

3. Generate the theme files.

```
make clean
make
```

4. Install the theme.

```
sudo make install
```


Public License
--------------
 GPLv2.0

 > **Note:**
 >
 > SVG files are licensed under CC BY-SA 4.0

Special Thanks to
--------------
 Nana-4, the developer of Materia.
 tista500 and the Adapta Theme Project: https://github.com/adapta-project/

