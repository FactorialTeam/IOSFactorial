
import Foundation
import UIKit
@objc class AppColors: NSObject {
    @objc static let appColor = UIColor(red: 249/255, green: 66/255, blue: 58/255, alpha: 1.0)//F9423A
    @objc static let darkRed = Appconstants.Color.darkRed
    @objc static let lightRed = Appconstants.Color.lightRed
}
struct Appconstants {
    struct Color {
        struct Navigation {
//            static let barTint = UIColor(red: 220/255, green: 31/255, blue: 39/255, alpha: 1.0)
            static let barTint = UIColor(red: 27/255, green: 184/255, blue: 147/255, alpha: 1.0)//F9423A
            static let tint = UIColor.white
        }
        static let darkRed = UIColor(red: 234.0 / 255.0, green: 54.0 / 255.0, blue: 54.0 / 255.0, alpha: 1)//ea3939
        static let lightRed = UIColor(red: 243.0 / 255.0, green: 84.0 / 255.0, blue: 84.0 / 255.0, alpha: 1)//ea3939
        static let lightBlue = UIColor(red: 165.0 / 255.0, green: 210.0 / 255.0, blue: 255.0 / 255.0, alpha: 1)//A5D2FF

        static let border = UIColor(red: 179.0 / 255.0, green: 179.0 / 255.0, blue: 179.0 / 255.0, alpha: 1)
        static let baground = UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1)
        static let texGreen = UIColor(red: 55/255, green: 187/255, blue: 1/255, alpha: 1.0)
        
    }
    
    struct Images {
        static let productDefaultImage = UIImage(named: "default.png")!
    }
    
    struct RedirectUrls {
        static let terms = "https://www.buymie.eu/Home/Terms"
        static let privacy = "https://www.buymie.eu/Home/Privacy"
        static let faqURl = "https://intercom.help/buymietechnology/pricing/how-are-your-prices-determined"
        
    }
    
    struct Fonts {
        static let regularNormalFont = AppFont.regular(size: 17).font
        static let nvigationTitleFont = AppFont.bold(size: 17).font
        
        enum OpenSansFont: String {
            case bold = "OpenSans-Bold"
            case semibold = "OpenSans-Semibold"
            case regular = "OpenSans"
            static func fontWith(type:OpenSansFont ,size: CGFloat )->UIFont{
                return UIFont(name: type.rawValue, size: size)!
            }
        }
        
        enum AppFont {
            case regular(size: CGFloat)
            case bold(size: CGFloat)
            case custom(name: String, size: CGFloat)
            
            var font: UIFont {
                switch self {
                case .regular(let size):
                   return OpenSansFont.fontWith(type: .regular, size: size)
                case .bold(let size):
                    return OpenSansFont.fontWith(type: .bold, size: size)
                case .custom(let name, let size):
                    if let font = UIFont(name: name, size: size) {
                        return font
                    }
                    return OpenSansFont.fontWith(type: .regular, size: size)
    
                }
            }
        }
    }
}



