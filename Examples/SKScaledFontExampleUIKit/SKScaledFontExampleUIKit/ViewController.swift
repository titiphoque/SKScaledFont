//
//  ViewController.swift
//  SKScaledFontExampleUIKit
//
//  Created by Thibaut Schmitt on 29/07/2020.
//  Copyright © 2020 Thibaut Schmitt. All rights reserved.
//

import UIKit
import SKScaledFont

enum TextStylesConfiguration: String {
    case circularStd = "CircularStd"
    case skScaledFont = "skScaledFontStyle"
}

class LargeTitleCircularStdLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.font = SKScaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue).font(forTextStyle: .largeTitle)
        self.adjustsFontForContentSizeCategory = true
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var skScaledFontTitleLabel: UILabel!
    
    @IBOutlet weak var largeTitle: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var subheadline: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var callout: UILabel!
    @IBOutlet weak var footnote: UILabel!
    @IBOutlet weak var caption1: UILabel!
    @IBOutlet weak var caption2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSKScaledFont()
        
        let circularStdStyle = SKScaledFont(textStylesFilename: TextStylesConfiguration.circularStd.rawValue)
        
        largeTitle.font = circularStdStyle.font(forTextStyle: .largeTitle)
        largeTitle.adjustsFontForContentSizeCategory = true
        largeTitle.text = "Large title"
            
        title1.font = circularStdStyle.font(forTextStyle: .title1)
        title1.adjustsFontForContentSizeCategory = true
        title1.text = "Title1"
            
        title2.font = circularStdStyle.font(forTextStyle: .title2)
        title2.adjustsFontForContentSizeCategory = true
        title2.text = "Title2"
            
        title3.font = circularStdStyle.font(forTextStyle: .title3)
        title3.adjustsFontForContentSizeCategory = true
        title3.text = "Title3"
            
        headline.font = circularStdStyle.font(forTextStyle: .headline)
        headline.adjustsFontForContentSizeCategory = true
        headline.text = "Headline"
            
        subheadline.font = circularStdStyle.font(forTextStyle: .subheadline)
        subheadline.adjustsFontForContentSizeCategory = true
        subheadline.text = "Subheadline"
            
        body.font = circularStdStyle.font(forTextStyle: .body)
        body.adjustsFontForContentSizeCategory = true
        body.text = "Body"
            
        callout.font = circularStdStyle.font(forTextStyle: .callout)
        callout.adjustsFontForContentSizeCategory = true
        callout.text = "Callout"
            
        footnote.font = circularStdStyle.font(forTextStyle: .footnote)
        footnote.adjustsFontForContentSizeCategory = true
        footnote.text = "Footnote"
            
        caption1.font = circularStdStyle.font(forTextStyle: .caption1)
        caption1.adjustsFontForContentSizeCategory = true
        caption1.text = "Caption1"
            
        caption2.font = circularStdStyle.font(forTextStyle: .caption2)
        caption2.adjustsFontForContentSizeCategory = true
        caption2.text = "Caption2"
    }

    func setupSKScaledFont() {
        let skScaledFontStyle = SKScaledFont(textStylesFilename: TextStylesConfiguration.skScaledFont.rawValue)
        skScaledFontTitleLabel.font = skScaledFontStyle.font(forTextStyle: .largeTitle)
        skScaledFontTitleLabel.text = "SKScaledFont"
    }
}

