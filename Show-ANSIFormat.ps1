<#
.SYNOPSIS
  Demo script for ANSI/VT100 formatting and colors
.DESCRIPTION
  This script displays examples of ANSI/VT100 formatting applied to text in the Windows 10 PowerShell terminal, including a chart of both standard console colors and 256 colors. No parameters are required.
#>

$esc="$([char]27)" # store the escape character

# Text Formatting & Reset Examples
echo "`n$esc[1;4mText Formatting & Reset Examples$esc[0m"
echo "$esc[0mNormal"                                  #reset all formatting
echo "Normal $esc[1mBold $esc[21mReset $esc[0m"       #bold
echo "Normal $esc[2mDim $esc[22mReset $esc[0m"        #dim  #this doesn't work in PS
echo "Normal $esc[4mUnderlined $esc[24mReset $esc[0m" #underlined
echo "Normal $esc[5mBlink $esc[25mReset $esc[0m"      #blinking #this doesn't work in PS
echo "Normal $esc[7mInverted $esc[27mReset $esc[0m"   #inverted fg/bg colors
echo "Normal $esc[8mHidden $esc[28mReset $esc[0m"     #hidden text  #this doesn't work in PS

# 16-Color Foreground Colors
echo "`n$esc[1;4m16-Color Foreground Colors$esc[0m"
echo "Default $esc[39mDefault$esc[0m"
echo "Default $esc[30mBlack$esc[0m"
echo "Default $esc[31mRed$esc[0m"
echo "Default $esc[32mGreen$esc[0m"
echo "Default $esc[33mYellow$esc[0m"
echo "Default $esc[34mBlue$esc[0m"
echo "Default $esc[35mMagenta$esc[0m"
echo "Default $esc[36mCyan$esc[0m"
echo "Default $esc[37mLight Gray$esc[0m"
echo "Default $esc[90mDark Gray$esc[0m"
echo "Default $esc[91mLight Red$esc[0m"
echo "Default $esc[92mLight Green$esc[0m"
echo "Default $esc[93mLight Yellow$esc[0m"
echo "Default $esc[94mLight Blue$esc[0m"
echo "Default $esc[95mLight Magenta$esc[0m"
echo "Default $esc[96mLight Cyan$esc[0m"
echo "Default $esc[97mWhite$esc[0m"

# 16-Color Background Colors
echo "`n$esc[1;4m16-Color Background Colors$esc[0m"
echo "Default $esc[49mDefault$esc[0m"
echo "Default $esc[40mBlack$esc[0m"
echo "Default $esc[41mRed$esc[0m"
echo "Default $esc[42mGreen$esc[0m"
echo "Default $esc[43mYellow$esc[0m"
echo "Default $esc[44mBlue$esc[0m"
echo "Default $esc[45mMagenta$esc[0m"
echo "Default $esc[46mCyan$esc[0m"
echo "Default $esc[47mLight Gray$esc[0m"
echo "Default $esc[100mDark Gray$esc[0m"
echo "Default $esc[101mLight Red$esc[0m"
echo "Default $esc[102mLight Green$esc[0m"
echo "Default $esc[103mLight Yellow$esc[0m"
echo "Default $esc[104mLight Blue$esc[0m"
echo "Default $esc[105mLight Magenta$esc[0m"
echo "Default $esc[106mLight Cyan$esc[0m"
echo "Default $esc[107mWhite$esc[0m"

# The following code was written by Sam Hocevar for bash, as seen on https://misc.flogisoft.com/bash/tip_colors_and_formatting
# It was adapted for PowerShell by Mike Grudziecki.

# The original license is replicated here:
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# 256-Color Foreground & Background Charts
echo "`n$esc[1;4m256-Color Foreground & Background Charts$esc[0m"
foreach ($fgbg in 38,48) {  # foreground/background switch
  foreach ($color in 0..255) {  # color range
    #Display the colors
    $field = "$color".PadLeft(4)  # pad the chart boxes with spaces
    Write-Host -NoNewLine "$esc[$fgbg;5;${color}m$field $esc[0m"
    #Display 6 colors per line
    if ( (($color+1)%6) -eq 4 ) { echo "`r" }
  }
  echo `n
}
