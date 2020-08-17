<p align="center">
  <img src="logo.png" height="250">
</p>

[![Build Status](https://api.travis-ci.org/miquido/aegithalos.svg?branch=master)](https://travis-ci.org/miquido/aegithalos)
[![Platforms](https://img.shields.io/badge/platform-iOS%20|%20iPadOS%20|%20macOS-gray.svg?style=flat)]()
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

Aegithalos is a small library focused on composition of mutating functions. It is useful for preparing visual styles or repeatable and composable setup for any types.

## Instalation

Easiest way to use Aegithalos is to add it as you Swift package dependency:

```swift
.package(url: "https://github.com/miquido/aegithalos.git", from: "1.0.0")
```

You can also use Xcode add SPM dependency option using this URL: `https://github.com/miquido/aegithalos.git`

## Common usage

Main component of this library is `Setup` struct. It is used to encapsulate and compose mutating functions. You can use it to define any kind of setup function that can be passed around and applied on multiple subjects. For example - to prepare common style for UILabel applied on different screens in your application.

```swift
let labelSetup = Setup.of(UILabel.self) { label in
  label.textAlignment = .center
  label.textColor = .gray
}
```

You can use it to apply same setup whenever it is needed. You can also prepare multiple styles depending on some state that can be applied on that state changes.

```swift
let labelAfterSetup = labelSetup(appliedOn: UILabel())
```

Moreover setup can be composed to refine and reuse common components and apply large set of settings on complicated subjects.

```swift
let baseLabelSetup = Setup.of(UILabel.self) { label in 
  /* do some base setup */ 
}
let errorLabelSetup = baseLabelSetup.composed { label in 
  /* add setup for errors */ 
}
```

Contramap allows to apply setup on more complex types. You can use keyPaths to specify path where setup will be applied inside encapsulating type.

```swift
class ErrorScreen: UIView {
  let label: UILabel
  // ...
}

let errorLabelSetup = Setup.of(UILabel.self) { label in /* do some setup */ }
let errorBackgroundSetup = Setup.of(UIView.self) { view in /* do some setup */ }

let errorScreenLabelSetup = errorLabelSetup.contramap(\ErrorScreen.label)
// unfortunatelly constraint required to allow identity keypath here is not representable in Swift yet
// you can use closure as workaround or for any additional operations that are required
let errorScreenBackgroundSetup = errorBackgroundSetup.contramap { (error: ErrorScreen) in error }
let errorScreenSetup = errorScreenLabelSetup.composed(with: errorScreenBackgroundSetup)

let errorScreenAfterSetup = errorScreenSetup(appliedOn: ErrorScreen())
```

## Useful patterns

One of the most useful patterns for composing complex setups from simpler ones is fluent interface pattern. You can provide extensions for `Setup` where associated `Subject` conforms to given protocol or is any given type which expose setup for any required properties. This allows more natural and readable composition.

Small example of UILabel setup extensions:

```swift
import UIKit

extension Setup where Subject: UILabel {
  
  func text(_ string: String) -> Self {
    composed { label in
      label.text = string
    }
  }
  
  func font(_ font: UIFont) -> Self {
    composed { label in
      label.font = font
    }
  }
  
  func color(_ color: UIColor) -> Self {
    composed { label in
      label.textColor = color
    }
  }
}
```

This small example allows us to prepare complex setup in more declarative manner:

```swift
let labelSetup = Setup.of(UILabel.self)
  .font(.systemFont(ofSize: 12))
  .color(.gray)
  .text("Sample label")
```

You can use it also to prepare full styles for any of your application's components:

```swift
extension Setup where Subject: UILabel {

  var titleLabel: Self {
    font(.systemFont(ofSize: 22))
    .color(.gray)
  }
}
```

## AegithalosCocoa

Aegithalos comes with set of usefull extensions for UIKit already prepared in AegithalosCocoa package. You can easily prapare any kind of UI setup with it, even layout constraints. Lets have a Signin with Apple button:

```swift
import AegithalosCocoa

let signinWithAppleButtonSetup
= Setup.of(UIButton.self)
  .backgroundColor(.black)
  .cornerRadius(5)
  .height(equalTo: 50)
  .titleColor(.white)
  .titleAlignment(.center)
  .titleFont(.systemFont(ofSize: 14, weight: .medium))
  .title(localized: "com.miquido.signin.apple.button.tittle")
  .titleInsets(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
  .tintColor(.white)
  .image(symbol: "applelogo")
```

## License

Copyright 2020 Miquido

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.