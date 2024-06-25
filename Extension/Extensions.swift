//
//  Extension.swift
//  MyCliniQ
//
//  Created by GuruApzzo on 06/09/23.
//

import Foundation
import UIKit


extension String {
    
    /// Localized string global declaration
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func getTrimmedUrlString() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

/*================================================================================================================*/


extension UIView {
    
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func roundedView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2.0
    }
    
    func setCornerRadius(radius: CGFloat, borderColor: UIColor = #colorLiteral(red: 0.5019607843, green: 0.5843137255, blue: 0.7176470588, alpha: 1), borderWidth: CGFloat = 0.0) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    func setCornerRadiusWithoutMask(radius: CGFloat, borderColor: UIColor = #colorLiteral(red: 0.5019607843, green: 0.5843137255, blue: 0.7176470588, alpha: 1), borderWidth: CGFloat = 0.0) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    func dropButtonShadow(scale: Bool = true,radius: Int = 8) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.cornerRadius = CGFloat(radius)
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    func addShadow(radius: Int = 15) {
        self.layer.shadowColor = UIColor(hexStr: "CFCFCF").cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = CGFloat(radius)
    }
}

/*================================================================================================================*/


extension UIColor {
    
    convenience init(hexStr: String) {
        var str = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (str.hasPrefix("#")) {
            str = (str as NSString).substring(from: 1)
        }
        
        if (str.count != 6) {
            self.init(white: 0.5, alpha: 1)
            return
        }
        
        let rString = (str as NSString).substring(to: 2)
        let gString = ((str as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((str as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    static var ratingDarkColor: UIColor? { return UIColor(named: "RatingDarkColor") }
    static var ratingGreenColor: UIColor? { return UIColor(named: "Primary color") }
    static var secondaryTextColor: UIColor? { return UIColor(named: "Secondary Text") }
    static var resultTVBorderColor: UIColor? { return UIColor(named: "resultTV_BorderColor") }
    static var cellbackgroundColor: UIColor? { return UIColor(named: "SelectCell") }
    static var detailsBorderColor: UIColor? { return UIColor(named: "details_BorderColor") }
    static var rightBarButtonColor: UIColor? { return UIColor(named: "right_BarButton_Color") }
    /*================================================================================================================*/
    
   // static var prescriptionCellBordercolor: UIColor? { return UIColor(named: "Prescription_Cell_bordercolor") }
    
    
}


/*================================================================================================================*/


extension UIImage {
    
    var alwaysTemplateRendering: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    
    /// Onboard Images
    static var onboard_Image_One: UIImage? { return UIImage(named: "OnboardingImageOne") }
    static var onboard_Image_Two: UIImage? { return UIImage(named: "OnboardingImageTwo") }
    static var onboard_Image_Three: UIImage? { return UIImage(named: "OnboardingImageThree") }
    static var onboard_Image_Four: UIImage? { return UIImage(named: "OnboardingImageFour") }
    
    ///Feedback rating images
    static var happyFillImage: UIImage? { return UIImage(named: "Happy_fill_image") }
    static var goodFillImage: UIImage? { return UIImage(named: "good_Fill_image") }
    static var okayFillImage: UIImage? { return UIImage(named: "Okay_fill_image") }
    static var notGoodFillImage: UIImage? { return UIImage(named: "Not_good_fill_image") }
    static var veryPoorFillImage: UIImage? { return UIImage(named: "Very_poor_fill_image") }
    
    static var happyUnFillImage: UIImage? { return UIImage(named: "Happy") }
    static var goodUnFillImage: UIImage? { return UIImage(named: "Good") }
    static var okayUnFillImage: UIImage? { return UIImage(named: "Okay") }
    static var notGoodUnFillImage: UIImage? { return UIImage(named: "Not_Good") }
    static var veryPoorUnFillImage: UIImage? { return UIImage(named: "Very_Poor") }
    static var rating: UIImage? { return UIImage(named: "Star_Fill") }
    static var unRating: UIImage? { return UIImage(named: "Star_Unfill") }
    
    /*================================================================================================================*/
    
    /// language Selection Images
    static var selectLanguage: UIImage? {return UIImage(named: "Rounded_Tick")}
    static var deSelectLanguage: UIImage? {return UIImage(named: "Rounded_Untick")}
    static var recommand: UIImage? {return UIImage(named: "Check_Square")}
    static var notRecommand: UIImage? {return UIImage(named: "Uncheck_Square")}
//    static var addIcon: UIImage? {return UIImage(named: "addIcon")}
}

/*================================================================================================================*/


extension UIViewController {
    
    func setUpSmallTitle(title: String) {
        navigationItem.title = title
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

/*================================================================================================================*/


extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}


/*================================================================================================================*/

extension Date {
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
     func localDate() -> Date {
           let nowUTC = Date()
           let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
           guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {
               return nowUTC
           }
           return localDate
       }
    
    func getSeventhDateFromNow() -> Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)!
    }
    
    func oneMonthdateFromDate() -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: Date())!
    }
    
    func getFormatedDateTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MMM-yyyy hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateMonthTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MMM hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateTimeString1() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MMM-yyyy @ hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDateString1() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM yyyy"
        return dateFormater.string(from: self)
    }
    
    func expenseReportDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMMM yyyy"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDateString3() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM dd yyyy"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDateString2() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDateDayString1() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = " EEE, MMM dd"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDateDayString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = " EEE, dd MMM, yyyy"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDayMonth() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, dd MMM"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateForAdmin() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = " EEE, dd MMM yyyy"
        return dateFormater.string(from: self)
    }
    
    func getNewFormatedDateDayString2() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, MMM dd"
        return dateFormater.string(from: self)
    }
    
    func getPrintFormatedDateDayString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE, MMM dd yyyy"
        return dateFormater.string(from: self)
    }
    
    func getPrintshortCutFormatedDateDayString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "E, MMM dd yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MMM-yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDayMonthString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM"
        return dateFormater.string(from: self)
    }
    
    
    func getFormatedMonthYearString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM-yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateShortString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM/yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateMonthString1() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM"
        return dateFormater.string(from: self)
    }
    
    func getFormatedMonthDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM dd"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateMonthString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MMM"
        return dateFormater.string(from: self)
    }
    
    func getFormatedStartDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFormatedFullStartDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MMM-yyyy"
        return dateFormater.string(from: self)
    }
    
    func getDateTime() -> (String,String) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let dateStr = "\(dateFormater.string(from: self))"
        
        dateFormater.dateFormat = "hh:mm a"
        let timeStr = "\(dateFormater.string(from: self))"
        return (dateStr, timeStr )
    }
    
    func getTime() -> (Int,String) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh"
        let dateStr = Int(dateFormater.string(from: self))
        
        dateFormater.dateFormat = "a"
        let timeStr = "\(dateFormater.string(from: self))"
        return (dateStr ?? 3, timeStr )
    }
    
    func getHTime() -> (Int,String) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH"
        let dateStr = Int(dateFormater.string(from: self))
        
        dateFormater.dateFormat = "a"
        let timeStr = "\(dateFormater.string(from: self))"
        return (dateStr ?? 3, timeStr )
    }
    
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func getUTCStringBasedOn(format: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: self)
    }
    
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func getTimetoUTC(fromTimeString: String, toTimeString: String) -> (String,String,String) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        
        let toDateTimeString = "\(dateFormater.string(from: self)) \(toTimeString)"
        let fromDateTimeString = "\(dateFormater.string(from: self)) \(fromTimeString)"
        
        dateFormater.dateFormat = "yyyy-MM-dd hh:mm a"
        
        if let fromDateWithTime = dateFormater.date(from: fromDateTimeString), let toDateWithTime = dateFormater.date(from: toDateTimeString) {
            dateFormater.timeZone = TimeZone(identifier: "Asia/Calcutta")
            dateFormater.dateFormat = "yyyy-MM-dd"
            
            let utcDate = dateFormater.string(from: toDateWithTime)
            dateFormater.dateFormat = "hh:mm a"
            let utcFromTime = dateFormater.string(from: fromDateWithTime)
            let utcToTime = dateFormater.string(from: toDateWithTime)
            
            return (utcDate, utcFromTime, utcToTime)
        }
  
        return ("", "", "")
    }
    
    func getOtherFormatedDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from: self)
    }
    
    func getUSFormatedDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM-dd-yyyy"
        return dateFormater.string(from: self)
    }
    
    func getIndFormatedDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFormatedContactDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM-dd"
        return dateFormater.string(from: self)
    }
    
    func getFormatedMonthDateString1() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, MMM dd"
        return dateFormater.string(from: self)
    }
    
    func getFormatedMonthString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDayString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd"
        return dateFormater.string(from: self)
    }
    
    func getFormatedTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getFormatedTimeStringWithoutDayAndNightTime() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm"
        return dateFormater.string(from: self)
    }
    
    func getFormatedTimeStringPeriod() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "a"
        return dateFormater.string(from: self)
    }
    
    func getFormatedTimeStringWithoutSpace() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mma"
        return dateFormater.string(from: self)
    }
    
    func getAbbrivatedDayDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, dd"
        return dateFormater.string(from: self)
    }
    
    func getServerFormatedDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormater.string(from: self)
    }
    
    func getServerFormatedDateStringUpcomingEvent() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormater.string(from: self)
    }
    
    func getFormatedDateStringWithPipeSymbol() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM dd | hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getYearString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy"
        return dateFormater.string(from: self)
    }
    
    func getFullDayMonthString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, dd MMM"
        return dateFormater.string(from: self)
    }
    
    func getFullDayMonthString1() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, MMM dd"
        return dateFormater.string(from: self)
    }
    
    func getFullDayString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        return dateFormater.string(from: self)
    }
    
    func getAbbrivatedDayString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE"
        return dateFormater.string(from: self)
    }
    
    func getMonthString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM"
        return dateFormater.string(from: self)
    }
    
    func getFullMonthString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMMM"
        return dateFormater.string(from: self)
    }
    
    func getFullMonthWithDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMMM dd, yyyy"
        return dateFormater.string(from: self)
    }
    
    func getMonthWithDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM dd, yyyy"
        return dateFormater.string(from: self)
    }
    
    func getMonthWithDateTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM dd, yyyy @ hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getFullMonthWithDateTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMMM dd, yyyy @ hh:mm a"
        return dateFormater.string(from: self)
    }
    
    
    func getFormattedDateTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM, hh:mm a"
        return dateFormater.string(from: self)
    }
    
    func getDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd"
        return dateFormater.string(from: self)
    }
    
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
    
    var getMilliseconds:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var getMillisecondsInInt64:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    
    func compareTimeOnly(to: Date) -> ComparisonResult {
        let calendar = Calendar.current
        let components2 = calendar.dateComponents([.hour, .minute, .second], from: to)
        let date3 = calendar.date(bySettingHour: components2.hour!, minute: components2.minute!, second: components2.second!, of: self)!
        
        let seconds = calendar.dateComponents([.second], from: self, to: date3).second!
        if seconds == 0 {
            return .orderedSame
        } else if seconds > 0 {
            // Ascending means before
            return .orderedAscending
        } else {
            // Descending means after
            return .orderedDescending
        }
    }
    
    func getElapsedInterval() -> String {
        print(self)
        print(Date())
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year" :
            "\(year)" + " " + "years"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month" :
            "\(month)" + " " + "months"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day" :
            "\(day)" + " " + "days"
        } else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour" :
            "\(hour)" + " " + "hours"
        } else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute" :
            "\(minute)" + " " + "minutes"
        } else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "second" :
            "\(second)" + " " + "seconds"
        } else {
            return "a moment ago"
        }
    }
}

class DateUtils {
    class func convertToDate(dateString: String?, format: DateFormate, timeZone: TimeZone = TimeZone(abbreviation: "UTC")!) -> Date? {
        guard let dateString = dateString else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = timeZone
        return dateFormatter.date(from: dateString)
    }
}

/*================================================================================================================*/

extension Array {
    func split() -> (array1: [Element], array2: [Element]) {
        let half = count / 2 + count % 2
        let head = self[0..<half]
        let tail = self[half..<count]

        return (Array(head), Array(tail))
    }
}



extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}


extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: (self.view.frame.size.width - 225)/2, y: self.view.frame.size.height-100, width: 225, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}

/*================================================================================================================*/

extension String {
    
    
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
    
}
