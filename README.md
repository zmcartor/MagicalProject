# Magical Project

Small project illustrating usage of [Magical Record](https://github.com/magicalpanda/MagicalRecord) and [Mogenerator](https://github.com/rentzsch/mogenerator) to create a modern Core Data stack.

### Errata
The build script within the Mogenerator target assumes the mogenerator command-line utility is installed within _/opt/local/bin/mogenerator_ . If this is not the case, change this to your path.

### Install
This project uses [CocoaPods](http://cocoapods.org)

##### Mogenerator
Included as a submodule. Building Mogenerator will spit out the finished script within _mogenerator/installer/build/root/usr/bin_ . Copy this binary to somewhere in your ```$PATH``` and update the Mogenerator target build script with this value. 

__OR__ - download Mogenerator .dmg if submodules aren't your thing.
[Mogenerator DMG](http://rentzsch.github.io/mogenerator/)
