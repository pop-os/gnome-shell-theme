SHELL = /bin/bash
COLOR_VARIANTS = '' '-dark' '-light'
SIZE_VARIANTS = '' '-slim'
VERSIONS = '3.18' '3.26' '3.28' '3.30'
SASSC_OPT=-M -t expanded
BASE_DIR=/usr/share/themes
REPODIR=$(CURDIR)
SRCDIR=$(REPODIR)/build
GNOMEVER=3.30
DEBIAN=0

all: gnome-shell

clean:
	-rm -rf ./src/**/*.css
	-rm -rf ./src/**/*.tmp
	-rm -rf build

uninstall:
	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    rm -rf /usr/share/themes/Pop$$color$$size/gnome-shell \
	           /usr/local/share/themesPop$$color$$size/gnome-shell; \
	  done; \
	done

	-rm -rf /usr/share/gnome-shell/theme/pop.css

install:
	@echo "** Installing the theme..."

	# Install GNOME Shell Theme
	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    export themedir=$(DESTDIR)$(BASE_DIR)/Pop$$color$$size; \
	    install -d $$themedir/gnome-shell; \
	    cd $(SRCDIR)/$(GNOMEVER); \
	    cp -ur \
	      *.svg \
	      $$themedir/gnome-shell; \
	    cp -urL \
	      extensions \
	      pad-osd.css \
	      $$themedir/gnome-shell; \
	    if [ "$$color" != '-dark' ]; then \
	      cp -urL \
	        assets \
	        $$themedir/gnome-shell; \
	    else \
	      cp -urL \
	        assets-dark \
	        $$themedir/gnome-shell/assets; \
	    fi; \
	    cp -ur \
	      gnome-shell$$color$$size.css \
	      $$themedir/gnome-shell/gnome-shell.css; \
	    cp -ur \
	      gnome-shell$$color$$size.css \
	      $$themedir/gnome-shell/pop.css; \
	    glib-compile-resources \
	      --sourcedir=$$themedir/gnome-shell \
	      --target=$$themedir/gnome-shell/gnome-shell-thememe.gresource \
	      gnome-shell-theme.gresource.xml; \
	  done; \
	done

	install -D $(DESTDIR)/usr/share/themes/Pop/gnome-shell/pop.css \
	           $(DESTDIR)/usr/share/gnome-shell/theme/pop.css
	cp -r $(DESTDIR)/usr/share/themes/Pop/gnome-shell/assets \
	      $(DESTDIR)/usr/share/gnome-shell/theme/

recolor:
	@echo "** Matching Colors"

	cd ./src/gtk-3.0/gtk-common/ && ./recolor-assets.sh > /dev/null
	cd ./src/gtk-2.0/ && ./recolor-assets.sh > /dev/null

sass: gnome-shell
	@echo "** Generating the CSS..."

gnome-shell:
	@echo "** Generating GNOME Shell..."

	-mkdir -p build

	for version in $(VERSIONS); do \
	  mkdir -p src/$$version; \
	  cp -r src/common/ build/$$version; \
	  cp -r src/$$version/ build/; \
	done

	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    for version in $(VERSIONS); do \
	      sassc $(SASSC_OPT) build/$$version/gnome-shell$$color$$size.{scss,css}; \
	      sassc $(SASSC_OPT) build/$$version/extensions/workspaces-to-dock/workspaces-to-dock.{scss,css}; \
	      sassc $(SASSC_OPT) build/$$version/pad-osd.{scss,css}; \
	    done; \
	  done; \
	done

.PHONY: all install uninstall clean gnome-shell
