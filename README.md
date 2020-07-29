# SKScaledFont

Use Dynamic Type font with custom font easily with UIKit or SwiftUI.

## Warning

If your min target version is **>= iOS 14**, do not use this package. Use instead :

```Swift
Text("Scaling")
    .font(.custom("Georgia", size: 24, relativeTo: .headline))
```

## Usage

Start by importing the package

```Swift
import SKScaledFont
```

### Define your text styles

#### Define your text styles for each style

Each plist define the font and size to use with one or more ```UIFont.TextStyle```.
If a TextStyle is not defined, it will fallback on ```UIFont.preferredFont``` with specified ```UIFont.TextStyle```.

In a ```Style1.plist``` file, add an entry for every ```UIFont.TextStyle``` you want to use.

```plist
<key>UICTFontTextStyleTitle0</key>
<dict>
    <key>fontName</key>
    <string>CircularStd-Bold</string>
    <key>fontSize</key>
    <integer>34</integer>
</dict>
```

Here is the list of all styles:

Plist key | UIFont.TextStyle 
--------- | ---------------- 
UICTFontTextStyleTitle0 | .largeTitle
UICTFontTextStyleTitle1 | .title1
UICTFontTextStyleTitle2 | .title2
UICTFontTextStyleTitle3 | .title3
UICTFontTextStyleHeadline | .headline
UICTFontTextStyleSubhead | .subheadline
UICTFontTextStyleBody | .body
UICTFontTextStyleCallout | .callout
UICTFontTextStyleFootnote | .footnote
UICTFontTextStyleCaption1 | .caption1
UICTFontTextStyleCaption2 | .caption2

#### Avoiding fallback on preferred font (optional)

To avoid falling back on preferred font, I suggest you to define an enum or a struct that define your text style configuration in one place :

```Swift
enum TextStylesConfiguration: String {
    case circularStd = "Style1"
    case skScaledFont = "skScaledFontStyle"
}

OR

struct TextStylesConfiguration {
    static let circularStd = "Style1"
    static let skScaledFont = "skScaledFontStyle"
}

OR

any way yout want
```

The string value must match a plist file in project, otherwise it will fallback on preferred font.

### SwiftUI usage

```Swift
Text("Large title").scaledFont(textStylesFilename: TextStylesConfiguration.skScaledFont.rawValue, style: .largeTitle)

Text("Large title").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .title1)
```

### UIKit usage

```Swift
let style1 = SKScaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue)

largeTitle.font = style1.font(forTextStyle: .largeTitle)
largeTitle.adjustsFontForContentSizeCategory = true
```

You can also subclass to define one class per style, you will avoid redundant code.

### Advanced

SKScaledFont provide a way to define text styles for every screen size. Just define a new plist named ```Style1-568h.plist``` to handle iPhone 5/5S/SE.
The plist name follow the following format: ```Style1-deviceHeighth.plist```. Some example:
* ```Style1-568h.plist```
* ```Style1-667h.plist```
* ```Style1-736h.plist```

## Requirements

**iOS** version **>= 11.0**

## Installation

### Swift Package Manager

**TODO**