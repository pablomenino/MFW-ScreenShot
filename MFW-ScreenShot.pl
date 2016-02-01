#!/usr/bin/perl

#----------------------------------------------------------------------------------------
# MFW ScreenShot Tool
# Version: 1.2.1
# 
# WebSite:
# https://github.com/pablomenino/MFW-ScreenShot
# http://pablomenino.github.io/MFW-ScreenShot/
# 
# Copyright © 2010 - Pablo Meniño <pablo.menino@gmail.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------
# Use declaration -----------------------------------------------------

use strict;
use warnings;
use Time::Local;
use Cwd;
use File::Basename;
use Switch;

#----------------------------------------------------------------------
# Variables -----------------------------------------------------------

# Version Control
my $version = "1.2.1";

# Filename
my $screenshot = "screenshot-";

# Home directory
my $home = $ENV{HOME};

# Directory to save files
my $dirto = "Pictures/ScreenShots";

# Creates an unusual filename based on nanoseconds so that
# you don't accidentally overwrite another screenshot.
my $nano = `date '+%d-%m-%Y_%H-%M-%S'`;
# Remove return line
chomp($nano);

# Adds the file extension
my $extension_png=".png";
my $extension_jpg=".jpg";

#----------------------------------------------------------------------
# Functions -----------------------------------------------------------

sub print_help()
{
	print "MFW ScreenShot Tool - Version $version\n";
	print "Copyright © 2009 - MFW TechNet - Pablo Meniño <pablo.menino\@gmail.com>\n";
	print "\n";
	print "Usage: $0 [options]\n";
	print "\n";
	print "options:\n";
	print "  --print_help               - Print this help\n";
	print "  --print_version            - Print version info\n";
	print "  --full_screenshot          - Full screen screenshot\n";
	print "  --area_screenshot          - Screen area screenshot\n";
	print "\n";
	print "Example:\n";
	print "  ./$0 --full_screenshot\n";
	print "  This command takes a full screen screenshot and saves to folder $home/$dirto in JPG and PNG format\n";
	print "\n";
	print "\n";
	print "NOTE:\n";
	print "  Edit the script to change the folder path to save the screenshots\n";
	print "\n";
}

sub print_version()
{
	print "MFW ScreenShot Tool - Version $version\n";
	print "Copyright © 2009 - MFW TechNet - Pablo Meniño <pablo.menino\@gmail.com>\n";
	print "\n";
	print "If you value your sanity ... beware ... http://mfw.com.ar ... is alive ...\n";
}

sub check_screenshot_dir()
{
	my ($file_to_check) = @_;

	# Check directory.
	if (-e $file_to_check)
	{
		return 0;
	} 
	else 
	{
		return 1;
	}
}


sub make_screenshot_dir()
{
	if ( &check_screenshot_dir("$home/$dirto") != 0 )
	{
		# Create directory ...
		`mkdir -p "$home/$dirto"`
	}
}

sub full_screenshot()
{
	print "MFW ScreenShot Tool - Version $version\n";
	print "Copyright © 2009 - MFW TechNet - Pablo Meniño <pablo.menino\@gmail.com>\n";
	print "\n";
	print "Check file dir ...\n";
	make_screenshot_dir();
	print "Take screenshot ...\n";
	`import -window root "$home/$dirto/$screenshot$nano$extension_png"`;
	`convert "$home/$dirto/$screenshot$nano$extension_png" "$home/$dirto/$screenshot$nano$extension_jpg"`;
	print " ... end.\n";
}

sub area_screenshot()
{
	print "MFW ScreenShot Tool - Version $version\n";
	print "Copyright © 2009 - MFW TechNet - Pablo Meniño <pablo.menino\@gmail.com>\n";
	print "\n";
	print "Check file dir ...\n";
	make_screenshot_dir();
	print "Take screenshot ... select windows area ...\n";
	`import "$home/$dirto/$screenshot$nano$extension_png"`;
	`convert "$home/$dirto/$screenshot$nano$extension_png" "$home/$dirto/$screenshot$nano$extension_jpg"`;
	print " ... end.\n";
}

#----------------------------------------------------------------------
# Main - Begin --------------------------------------------------------

# Check script arguments.
if ($#ARGV != 0)
{
	print_help();
}
else
{
	switch ($ARGV[0])
	{
		case "--print_help"
		{
			print_help();
		}
		case "--print_version"
		{
			print_version();
		}
		case "--full_screenshot"
		{
			full_screenshot();
		}
		case "--area_screenshot"
		{
			area_screenshot();
		}
		else
		{
			print_help();
		}
	}
}

#----------------------------------------------------------------------
# Main - End ----------------------------------------------------------
#----------------------------------------------------------------------
