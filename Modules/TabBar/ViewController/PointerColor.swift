

import Foundation
import UIKit

struct PointerColor {
    
    var name: AssetsColor
    
    init(_ name: AssetsColor) {
        self.name = name
    }
    
    enum AssetsColor: String {
        
        case primary = "Primary color"
        case textPrimary = "Primary Text"
        case TextSecondary = "Secondary Text"
        case unselectedColor = "unselectedColor"
        case segmentFill = "segementFill"
        case segmentBorder = "segmentBorder"
        case white = "WhiteColor"
        case strike = "strike"
        case buttonOff = "ButtonOff"
        case shadow = "shadowColor"
    }
    
    var instance: UIColor {
        return UIColor(named: name.rawValue) ?? UIColor.systemBlue
    }
    
}
