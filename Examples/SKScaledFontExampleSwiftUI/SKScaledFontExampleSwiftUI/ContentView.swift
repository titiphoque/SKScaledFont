//
//  ContentView.swift
//  SKScaledFontExampleSwiftUI
//
//  Created by Thibaut Schmitt on 29/07/2020.
//  Copyright © 2020 Thibaut Schmitt. All rights reserved.
//

import SwiftUI
import SKScaledFont

enum TextStylesConfiguration: String {
    case circularStd = "CircularStd"
    case skScaledFont = "skScaledFontStyle"
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 12, content: {
                Group {
                    Text("SKScaledFont")
                        .scaledFont(textStylesFilename: TextStylesConfiguration.skScaledFont.rawValue, style: .largeTitle)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                    
                    Divider()
                }
                
                Group {
                    Text("Large title").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .largeTitle)
                    Text("Title1").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .title1)
                    Text("Title2").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .title2)
                    Text("Title3").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .title3)
                    Text("Headline").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .headline)
                    Text("Subheadline").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .subheadline)
                }
                
                Group {
                    Text("Body").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .body)
                    Text("Callout").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .callout)
                    Text("Footnote").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .footnote)
                    Text("Caption1").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .caption1)
                    Text("Caption2").scaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue, style: .caption2)
                }
            })
            .padding(32)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
