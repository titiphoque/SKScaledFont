//
//  ScaledFontModifier.swift
//  ScaledFontSample
//
//  Created by Thibaut Schmitt on 29/07/2020.
//  Copyright © 2020 Thibaut Schmitt. All rights reserved.
//

#if canImport(SwiftUI)

import SwiftUI

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font

@available(iOS, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
@available(macCatalyst, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
@available(tvOS, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
@available(watchOS, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    
    var textStylesFilename: String
    var style: UIFont.TextStyle
    
    func body(content: Content) -> some View {
        let scaledFont = SKScaledFont(textStylesFilename: textStylesFilename)
        let font = scaledFont.font(forTextStyle: style)
        
        return content.font(Font.custom(font.fontName, size: font.pointSize))
    }
}

@available(iOS, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
@available(macCatalyst, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
@available(tvOS, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
@available(watchOS, introduced: 13, deprecated: 14, message: "Use `.font(.custom(String, size: CGFlaot, relativeTo: UIFont.TextStyle))`")
public extension View {
    func scaledFont(textStylesFilename: String, style: UIFont.TextStyle) -> some View {
        return self.modifier(ScaledFont(textStylesFilename: textStylesFilename, style: style))
    }
}

#endif
