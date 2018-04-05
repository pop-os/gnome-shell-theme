# TESTING.md

*Package Maintainers!*
This document describes testing procedures for the software contained in this
repository. All sections must be completed and signed off before a package can
be moved from one repository to the next.

## Part 1: Staging -> Proposed
* Did it build?
* Are files present in build package:
    - Check package, data.tar - make sure all files intended to be installed are
      there

## Part 2: Proposed -> Stable

**Gnome shell**<a name="shell"></a>
 - orange underline/straightlines everywhere
 - calendar - selected day is orange - days with events are blue
 - volume slider should be blue
 - active popup menu - orange
 - wifi selection is blue
 
 **Other things to note:**
 
 - Everything has a shadow
 - Everything needs to be legible/high contrast
 - Bright colors and title bars all have an inactive shade (when window is not selected)
 - Compact variants need to shrink most padding and sizes.

 **If something visibly looks off, check the color hex values.**
 
 *Color hex values:*
 - Text and monocromatic images: #4B4645
 - Header/Title Bars: #574F4A / Dark Theme: #3E3936 / Light Theme: #C8C0BD
 - Window background: #F5F5F5
 - Green selection:#01967A
 - Orange: #FAA41A / Dark theme: #CC7900
 - Blue: #48B9C7 / Dark theme: #0A97A5
