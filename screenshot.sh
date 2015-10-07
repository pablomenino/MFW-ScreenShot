#!/bin/bash

##############################################################################
#  ScreenShot Tool                                                           #
#  Version 1.0                                                               #
#                                                                            #
#  Copyright © 2009 - Mouth For War - Pablo Meniño <pablo.menino@gmail.com>  #
#                                                                            #
#  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #
#                                                                            #
#  This program is free software; you can redistribute it and/or modify      #
#  it under the terms of the GNU General Public License as published by      #
#  the Free Software Foundation; either version 2 of the License, or         #
#  (at your option) any later version.                                       #
#                                                                            #
#  This program is distributed in the hope that it will be useful,           #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of            #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             #
#  GNU General Public License for more details.                              #
##############################################################################

# The name of your file
screenshot='screenshot';

# Creates an unusual filename based on nanoseconds so that
# you don't accidentally overwrite another screenshot.
# The `backticks` tell the script to run another command (date).
# Type 'man date' in the terminal for more info
nano=`date '+%d-%m-%Y_%H-%M-%S'`;

# Adds the file extension
extension='.png';
extensionTo='.jpg';

# Generate a filename for this screenshot
file="$HOME/Pictures/ScreenShots/$screenshot-$nano$extension";
fileTo="$HOME/Pictures/ScreenShots/$screenshot-$nano$extensionTo";

# Use ImageMagick to take the screenshot
# Saves to ~/Pictures/ScreenShots
import $file;
convert  $file $fileTo;
