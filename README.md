#  Aegithalos

Aegithalos is a small library focused on composition if mutating functions. It is useful for preparing visual styles or repeatable and composable setup for any types.

## Common usage

Main component of this library is `Setup` struct. It is used to encapsulate and compose mutating functions. You can use it to just  define some kind of setup function that can be passed around and applied on multiple subjects. For example - to prepare common style for UILabel applied on different screens in your application.

```swift
let labelSetup = Setup.of(UILabel.self) { label in
  label.textAlignment = .center
  label.textColor = .gray
}
```

You can use it to apply same satup whenever it is needed. You can also prepare multiple styles depending on some state that can be applied on that state changes.

```swift
let labelAfterSetup = labelSetup(appliedOn: UILabel())
```

Moreover setup can be composed to refine and reuse common components and apply large set of settings on complicated subjects.

```swift
let baseLabelSetup = Setup.of(UILabel.self) { label in /* do some base setup */ }
let errorLabelSetup = baseLabelSetup.composed { label in /* add setup for errors */ }
```

Contramap allows to apply setup on more complex types. You can use keyPaths to specify path where setup will be applied on encapsulating type.

```swift
class ErrorScreen: UIView {
  let label: UILabel
  // ...
}

let errorLabelSetup = Setup.of(UILabel.self) { label in /* do some setup */ }
let errorBackgroundSetup = Setup.of(UIView.self) { view in /* do some setup */ }

let errorScreenLabelSetup = errorLabelSetup.contramap(\ErrorScreen.label)
// unfortunatelly constraint required to allow identity keypath here is not representable in Swift
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

This small example allows us to prepare complex setup in more functional manner:

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

Aegithalos comes with set of usefull extensions for UIKit already prepared in AegithalosCocoa package.
