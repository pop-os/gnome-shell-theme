## Summary

- Do not edit the CSS directly, edit the source SCSS files and run `make sass`
- To be able to use the latest/adequate version of Sass, install `sassc`
- To change the SVG assets color, use the recoloring script, and do not edit the
  svg.in files.

## The theme build process

Pop GNOME Shell theme is created using SCSS source code which is 
programmatically compiled into usable CSS for the theme. If you modify the CSS
files, your changes will be overwritten when you run `make`. Instead, edit the
SCSS files. 

The SCSS is broken into sections to make modification easier. The main files in
the `src/common` directory are the main files, and should not be edited by hand.
The editable source files are in `src/common/sass`. 

If a specific version of the theme requires differences from what the main theme
carries, then those should be placed in the `src` directory under a subdirectory
with the name of the version. The latest version of GNOME supported should not
have any overrides; the `common` folder should build a correct theme for the 
current latest version. 

A basic directory layout is below:

```
src/
    common/ - The main theme files
           assets/ - SVG images for use in the theme (light versions)
           assets-dark/ - SVG images for use in the theme (dark versions)
           extensions/ - Theming for extensions that require their own stylesheets
           sass/ - Main theme source code
                widgets/ - Theme source for individual widgets in the shell
                _color-palette.scss - The color palette used in the theme
                _colors.scss - Actual color definitions
                _common.scss - The master source file, which includes other files
                _drawing.scss - code for drawing specific widgets
                _extensions.scss - overrides for specific extensions
                _variables.scss - Reusable variables
           gnome-shell(*).scss - The files which are generated into CSS.
    3.18/ - Overrides for GNOME 3.18
    3.24/ - Overrides for GNOME 3.24
    ...
```

When the theme is built, first a copy of the common folder is generated for each
version of the theme. Then, the override directory is overlaid on top of that, 
replacing parts that require changes from the main theme. This ensures that old
versions can be supported with minimal overhead without relaying on large 
networks of symlinks.

## Adding new GNOME versions

New GNOME Versions should be specified in the Makefile. You will also need to 
create a folder for the new version (if one doesn't exist) and place the changes
required to make the theme work there. If the version is newer than the current
newest supported version, back up the common folder into the current newest 
version's override folder, then modify the files in `common` as required. Delete
the files without changes from the older version (to save space), then add the 
new version to the `Makefile`.