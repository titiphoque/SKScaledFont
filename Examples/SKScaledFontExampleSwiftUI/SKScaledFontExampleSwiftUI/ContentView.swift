//
//  ContentView.swift
//  SKScaledFontExampleSwiftUI
//
//  Created by Thibaut Schmitt on 29/07/2020.
//  Copyright © 2020 Thibaut Schmitt. All rights reserved.
//

import SwiftUI
import SKScaledFont

extension SKScaledFontStyle {
    var circularStd: String { "CircularStd" }
    var skScaledFont: String { "skScaledFontStyle" }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 12, content: {
                Group {
                    Text("SKScaledFont")
                        .scaledFont(skStyle: \.skScaledFont, style: .largeTitle)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                    
                    Divider()
                }
                
                Group {
                    Text("Large title").scaledFont(skStyle: \.circularStd, style: .largeTitle)
                    Text("Title1").scaledFont(skStyle: \.circularStd, style: .title1)
                    Text("Title2").scaledFont(skStyle: \.circularStd, style: .title2)
                    Text("Title3").scaledFont(skStyle: \.circularStd, style: .title3)
                    Text("Headline").scaledFont(skStyle: \.circularStd, style: .headline)
                    Text("Subheadline").scaledFont(skStyle: \.circularStd, style: .subheadline)
                }
                
                Group {
                    Text("Body").scaledFont(skStyle: \.circularStd, style: .body)
                    Text("Callout").scaledFont(skStyle: \.circularStd, style: .callout)
                    Text("Footnote").scaledFont(skStyle: \.circularStd, style: .footnote)
                    Text("Caption1").scaledFont(skStyle: \.circularStd, style: .caption1)
                    Text("Caption2").scaledFont(skStyle: \.circularStd, style: .caption2)
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
