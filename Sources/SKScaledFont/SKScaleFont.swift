//
//  ScaledFont.swift
//  ScaledFontSample
//
//  Created by Thibaut Schmitt on 29/07/2020.
//  Copyright © 2020 Thibaut Schmitt. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public final class SKScaledFont {
    private struct FontDescription: Decodable {
        let fontSize: CGFloat
        let fontName: String
    }
    
    private typealias StyleDictionary = [UIFont.TextStyle.RawValue: FontDescription]
    private var styleDictionary: StyleDictionary?
    
    public convenience init(style: KeyPath<SKScaledFontStyle, String>) {
        let fontStyle = SKScaledFontStyle()
        self.init(textStylesFilename: fontStyle[keyPath: style])
    }
    
    /// Create a `ScaledFont`
    ///
    /// - Parameter fontName: Name of a plist file (without the extension)
    ///   in the main bundle that contains the style dictionary used to
    ///   scale fonts for each text style.
    private init(textStylesFilename: String) {
        // Compute filename
        let sizeFilename = "\(textStylesFilename)-\(Int(UIScreen.main.bounds.height))h"
        
        // Get configuration file
        if let url = Bundle.main.url(forResource: sizeFilename, withExtension: "plist"),
            let data = try? Data(contentsOf: url) {
            decodePlistData(data)
        } else if let url = Bundle.main.url(forResource: textStylesFilename, withExtension: "plist"),
            let data = try? Data(contentsOf: url) {
            decodePlistData(data)
        }
    }
    
    private func decodePlistData(_ data: Data) {
        let decoder = PropertyListDecoder()
        styleDictionary = try? decoder.decode(StyleDictionary.self, from: data)
    }
    
    /// Get the scaled font for the given text style using the
    /// style dictionary supplied at initialization.
    ///
    /// - Parameter textStyle: The `UIFontTextStyle` for the
    ///   font.
    /// - Returns: A `UIFont` of the custom font that has been
    ///   scaled for the users currently selected preferred
    ///   text size.
    ///
    /// - Note: If the style dictionary does not have
    ///   a font for this text style the default preferred
    ///   font is returned.
    public func font(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        guard let fontDescription = styleDictionary?[textStyle.rawValue],
            let font = UIFont(name: fontDescription.fontName, size: fontDescription.fontSize) else {
                return UIFont.preferredFont(forTextStyle: textStyle)
        }
        
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: font)
    }
}
#endif
