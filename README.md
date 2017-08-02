[![Language Swift 3](https://img.shields.io/badge/Language-Swift%203-orange.svg)](https://developer.apple.com/swift)
[![Objective-C compatible](https://img.shields.io/badge/Objective%20C%20-compatible-brightgreen.svg)](https://developer.apple.com/documentation/objectivec)


# UIRippleWave
UIView+Ripple+Wave is a lightweight framework that adds a waving effect to any UIView and written in Swift.


## Screenshots

![alt text][UIRippleWave]

[UIRippleWave]: https://github.com/vigneshuvi/UIRippleWave/blob/master/Screenshots/UIRippleWave.gif

## iOS import headers

First thing is to import the framework. See the Installation instructions on how to add the framework to your project.

```swift

//iOS - Objective-C
@import UIRippleWave;

//iOS - Swift
import UIRippleWave

```

## Example

UIRippleWave can be used without any wrappers nor layout and touch handling, simply call the start wave function.

### Example 1 - Objective-C

```swift

// Start waving.
    [self.uviView setEnableWaveEffect:YES];
    [self.uviButton startWaving];
    [self.uviImageView startWavingWithColorWithColor:[UIColor redColor] repeatCount:1];
    [self.uviImageView startWavingWithRepeatCountWithRepeatCount:1];

```

### Example 2 - Swift

```swift

// Start waving.
self.uviView.startWaving();
self.uviButton.startWavingWithColor(color: UIColor.green, repeatCount: 1);
self.uviImageView.startWavingWithRepeatCount(repeatCount: Float.infinity);

```

## Sample Projects

  Sample Projects available under the /Examples folder. 

## Installation

### CocoaPods

Check out [Get Started](http://cocoapods.org/) tab on [cocoapods.org](http://cocoapods.org/).

To use UIRippleWave in your project add the following 'Podfile' to your project

	source 'https://github.com/CocoaPods/Specs.git'
	platform :ios, '8.0'
	use_frameworks!

	pod 'UIRippleWave'

Then run:

    pod install || pod update


## License

UIRippleWave is licensed under the MIT License.

## Contact

### Vignesh Kumar

* http://vigneshuvi.github.io