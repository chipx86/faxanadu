Faxanadu for NES Disassembly
============================

[Faxanadu](https://www.mobygames.com/game/7331/faxanadu/) is a criminally
under-appreciated game for the NES, combining action, platforming, and some
puzzle-solving with an atmosphere you don't often see on the NES.

I've been working on a full disassembly of the game (sometimes
[streaming it on Twitch](https://www.twitch.tv/chipx86)) with the following
goals:

* Accuracy of information
* Documentation of all major parts of the codebase
* Identification of everything in RAM.
* Enough information to help people mod this wonderful game.

Through this work, I've made some fun discoveries. My favorites:

* [A full scripting language](https://notes.chipx86.com/Projects/Reverse-Engineering+Projects/Faxanadu+Disassembly/Interaction+Scripts),
  used for all NPC and item interactions
* [Debug level select code](https://notes.chipx86.com/Projects/Reverse-Engineering+Projects/Faxanadu+Disassembly/Debug+Level+Switch+Code#Activating+this+code),
  which can be activated using two Game Genie codes


# What's in this tree

* [src](https://github.com/chipx86/faxanadu/tree/main/src) -
  Annotated assembly files for Faxanadu, compatible with
  [asm6f](https://github.com/freem/asm6f).
* [html](https://github.com/chipx86/faxanadu/tree/main/html) -
  HTML version of the annotated HTML assembly files
* [ghidra](https://github.com/chipx86/faxanadu/tree/main/ghidra) -
  Ghidra files where my disassembly work is being done
* [mesen](https://github.com/chipx86/faxanadu/tree/main/mesen) -
  Labels/symbols files for the [Mesen](https://www.mesen.ca/) emulator's
  debugger


# Documentation

There's both annotated assembly and higher-level docs on Faxanadu available.

* [Annotated HTML Assembly](https://chipx86.com/faxanadu/)

  (Please note this is generated with a custom exporter for
  [Ghidra](https://github.com/NationalSecurityAgency/ghidra), which is still
  very much a work-in-progress.)

* [Faxanadu Internals Notes](https://notes.chipx86.com/Projects/Reverse-Engineering+Projects/Faxanadu+Disassembly/!+Overview)

  My collection of notes and full-on documentation of parts of the Faxanadu
  codebase, incuding password system and interaction scripting language.


# Compiling Faxanadu

The [source files](https://github.com/chipx86/faxanadu/tree/main/src) can be
compiled using [asm6f](https://github.com/freem/asm6f), producing a
byte-for-byte copy of the Faxanadu code.

This has been tested on macOS and Linux.

Please note that this is purely for experimental and research purposes. Please
don't use this as a way of pirating the game. Surely this is an inconvenient
way to go about it.


# Using the Mesen Labels File

The Mesen Labels File will make any symbols/labels from my diassembly work
available in the Mesen debugger.

To use it:

1. Download [mesen/faxanadu.mlb](https://github.com/chipx86/faxanadu/blob/main/mesen/faxanadu.mlb).

2. In Mesen, open your completely legally-obtained Faxanadu ROM.

3. Open **Debug -> Debugger**, and then **File -> Workspace -> Import Labels**.

4. Select the `faxanadu.mlb` file.


# Other resources

* [Faxanatools](https://github.com/chipx86/faxanatools), a set of Python tools
  I'm building to help inspect and mod Faxanadu.

* [Faxanadu Randomizer](https://www.romhacking.net/utilities/1470/), a different
  Faxanadu adventure every time you play.


# Special thanks

* Hungry Goriya ([YouTube](https://www.youtube.com/hungrygoriya),
  [Twitch](https://www.twitch.tv/hungrygoriya)),
  a fantastic retro streamer and Faxanadu fan with an amazing community.

* Refraction ([BlueSky](https://bsky.app/profile/refractionpcsx2.bsky.social)),
  a fellow dev who's 🤔'd and 🧐'd with me on stream while I've debugged
  some of this.

* Songbirder ([BlueSky](https://bsky.app/profile/songbirder.social),
  [Twitch](https://www.twitch.tv/songbirder)) from the Faxanadu Randomizer
  project, who's been very kind and encouraging with this work.


# What else do I do?

I'm the founder and CEO of [Beanbag](https://beanbaginc.com), creators of
[Review Board](https://www.reviewboard.org/), one of the first code review
products on the market (before GitHub even existed!).

Previously, I worked at VMware on the Workstation, Player, Server, WSX, and
View products. I worked in the Linux desktop on parts of GNOME and GTK+, and
was a core developer of the Gaim/Pidgin IM client.

You can find me elsewhere on the Internet at:

* [Website](https://chipx86.com)
* [Blog](https://chipx86.blog)
* [Bluesky](https://bsky.app/profile/chipx86.com)
* [Twitter/X](https://x.com/chipx86)
* [Mastodon](https://mastodon.online/@chipx86)
* [LinkedIn](https://www.linkedin.com/in/chipx86/)
* [GitHub](https://github.com/chipx86/)
* [Buy Me A Coffee](https://buymeacoffee.com/chipx86)
