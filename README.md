# JFEmnemo

JFEMnemo is an iOS version of the ruby gem rufus-mnemo. It turns integers into japanese sounding words and vice versa (ruby).



## How to use ?

Simply import file


```objc
#import 'JFEMnemo.h'
```

Then call

```objc
NSString * mnemo = [[JFEMnemo sharedManager] fromInteger:2455];
long result = [[JFEMnemo sharedManager] toInteger:mnemo];
```


## Requirements

iOS 6.0 and later.

## Usage

Add `JFEMnemo.h/m` into your project, or `pod 'JFEMnemo'` using CocoaPods.
