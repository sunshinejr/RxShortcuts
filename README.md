# RxShortcuts

[![CocoaPods](https://img.shields.io/cocoapods/v/RxShortcuts.svg)](https://github.com/sunshinejr/RxShortcuts)
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg)
[![License](https://img.shields.io/cocoapods/l/RxShortcuts.svg?style=flat)](http://cocoapods.org/pods/RxShortcuts)
[![Platform](https://img.shields.io/cocoapods/p/RxShortcuts.svg?style=flat)](http://cocoapods.org/pods/RxShortcuts)

Shortcuts for [RxSwift/RxCocoa](https://github.com/ReactiveX/RxSwift).<br /><br />
**Warning!** Since `RxSwift` 3.0.0 (and Swift 3.0), shortcuts like `subscribeNext`,
`doOnNext` etc. have been removed from the core library. There was a reason for
that and let me quote [@kzaher](https://github.com/kzaher) about the shortcuts
(old extensions):

> The downsides of old extensions were inconsistencies with Swift API guidelines.
> They also weren't expressing that calling them actually performes additional
> subscriptions and thus potentially additional work beside just registering
> observers.

However I really like these shortcuts and I'm using them in my projects anyways,
so I though that I would share.

# Shortcuts

List of available shortcuts for `RxSwift`:
```swift
subscribeNext(_:)
subscribeError(_:)
subscribeCompleted(_:)

doOnNext(_:)
doOnError(_:)
doOnCompleted(_:)

[Observable.just(1)].merge()
[Observable.just(1)].concat()
[Observable.just(1)].zip(_:)
[Observable.just(1)].combineLatest(_:)
```

List of available shortcuts for `RxCocoa` (and `Driver`):
```swift
driveNext(_:)
driveCompleted(_:)

doOnNext(_:)
doOnCompleted(_:)
```

If you think that there should be more, please make an
[Issue](https://github.com/sunshinejr/RxShortcuts/issues/new) or [Pull Request](https://github.com/sunshinejr/RxShortcuts/compare).

## Example

To run the example project, clone the repo, and run `pod install` from the
Example directory first.

## Requirements

- `RxSwift` ~> 3.0.0

## Installation

If you want the shortcuts only for `RxSwift`, add the following line to Podfile:
```ruby
pod "RxShortcuts"
```

If you want the shortcuts for both `RxSwift` and `RxCocoa`, then add this line:
```ruby
pod "RxShortcuts/RxCocoa"
```

## Author

Sunshinejr, thesunshinejr@gmail.com, <a href="https://twitter.com/thesunshinejr">@thesunshinejr</a>

## License

RxShortcuts is available under the MIT license. See the LICENSE file for more info.
