<div align=center>
<img src="https://github.com/AudioKit/Cookbook/raw/main/Cookbook/Cookbook/Assets.xcassets/audiokit-icon.imageset/audiokit-icon.png" width="20%"/>

# STK AudioKit

[![Build Status](https://github.com/AudioKit/STKAudioKit/workflows/CI/badge.svg)](https://github.com/AudioKit/STKAudioKit/actions?query=workflow%3ACI)
[![License](https://img.shields.io/github/license/AudioKit/STKAudioKit)](https://github.com/AudioKit/STKAudioKit/blob/main/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/AudioKit)](https://github.com/AudioKit/AudioKit/wiki)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
[![Twitter Follow](https://img.shields.io/twitter/follow/AudioKitPro.svg?style=social)](https://twitter.com/AudioKitPro)

</div>

This extension to AudioKit allows you to use physical models from Stanford's [Synthesis Toolkit (STK)](https://ccrma.stanford.edu/software/stk/).

## Installation in Xcode 13

You can AudioKit and any of the other AudioKit libraries using Collections

1. Select File -> Add Packages...
2. Click the `+` icon on the bottom left of the Collections sidebar on the left.
3. Choose `Add Swift Package Collection` from the pop-up menu.
4. In the `Add Package Collection` dialog box, enter `https://swiftpackageindex.com/AudioKit/collection.json` as the URL and click the "Load" button.
5. It will warn you that the collection is not signed, but it is fine, click "Add Unsigned Collection".
6. Now you can add any of the AudioKit Swift Packages you need and read about what they do, right from within Xcode.

## API Reference

* [STK Base](https://github.com/AudioKit/STKAudioKit/wiki/STKBase) - Superclass for STK physical models, do not use directly
* [Clarinet](https://github.com/AudioKit/STKAudioKit/wiki/Clarinet)
* [Flute](https://github.com/AudioKit/STKAudioKit/wiki/Flute)
* [Mandolin String](https://github.com/AudioKit/STKAudioKit/wiki/MandolinString)
* [Rhodes Piano](https://github.com/AudioKit/STKAudioKit/wiki/RhodesPianoKey)
* [Shaker](https://github.com/AudioKit/STKAudioKit/wiki/Shaker)
* [Shaker Type](https://github.com/AudioKit/STKAudioKit/wiki/ShakerType)
* [Tubular Bells](https://github.com/AudioKit/STKAudioKit/wiki/TubularBells)

## Examples

See the [AudioKit Cookbook](https://github.com/AudioKit/Cookbook/) for examples.
