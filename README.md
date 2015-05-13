# JFEMnemo

[![CI Status](http://img.shields.io/travis/Jerome Freyre/JFEMnemo.svg?style=flat)](https://travis-ci.org/Jerome Freyre/JFEMnemo)
[![Version](https://img.shields.io/cocoapods/v/JFEMnemo.svg?style=flat)](http://cocoapods.org/pods/JFEMnemo)
[![License](https://img.shields.io/cocoapods/l/JFEMnemo.svg?style=flat)](http://cocoapods.org/pods/JFEMnemo)
[![Platform](https://img.shields.io/cocoapods/p/JFEMnemo.svg?style=flat)](http://cocoapods.org/pods/JFEMnemo)

JFEMnemo is an iOS version of the ruby gem rufus-mnemo. It turns integers into japanese sounding words and vice versa (ruby).

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

JFEMnemo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JFEMnemo"
```


## How to use ?

Simply import file


```objc
#import 'JFEMnemo.h'
```

Then call

```objc
// 76955 will return haruka
NSString * mnemo = [[JFEMnemo sharedManager] fromInteger:76955];

long result = [[JFEMnemo sharedManager] toInteger:mnemo];
```


## Requirements

iOS 6.0 and later.


## Author

Jerome Freyre, jerome.freyre@gmail.com

## License

JFEMnemo is available under the MIT license. See the LICENSE file for more info.
