//
//  AppUtility.swift
//  RiyoWork
//
//  Created by MacBook Pro on 04/03/2023.
//

import Foundation
import UIKit
import SwiftLoader



protocol Action {
    func Handle(action:UIAlertAction)
}

class AppUtility:NSObject {
    
    var delegate : Action?
    
    // define a message structure
    struct EventMessage {
        
        // define two properties
        var dates = ""
        var phrases = ""
    }
    /*
     // Method: hexColor
     // Description: Use method to get color from hex string
     // Param: Hex color string without #
     */
    public class func hexColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /*
     // Method: validateEmail
     // Description: Use method to validate email format
     // Param: email
     */
    public class func validateEmail(with email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    /*
     // Method: Is Textfield empty
     // Description: Check Textfield is empty or not
     */
    public class func isTextFieldEmpty(textFieldText:String) -> Bool {
        if textFieldText == "" {
            return true
        } else {
            return false
        }
    }
    
    /*
     // Method: showMessage
     // Description: Show message alert to user
     // params: title, message, controller
     */
    public class func showMessage(title:String, message:String, controller:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        controller.present(alert, animated: true)
    }
    /*
     // Method: showMessage
     // Description: Show message alert to user
     // params: title, message, controller
     */
    func showMessageAndClickOK(title:String, message:String, controller:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.delegate?.Handle(action: action)
            
        }))
        controller.present(alert, animated: true)
    }
    
    /*
     // Method: unableViewUserInteraction
     // Description: To unable/disable view
     // params: isEnable, controller
     */
    public class func unableViewUserInteraction(isEnable:Bool, controller:UIViewController) {
        controller.view.resignFirstResponder()
        controller.view.isUserInteractionEnabled = isEnable
    }
    
    /*
     // Method: hexStringToUIColor
     // Description: To get UIColor against Hex string
     // params: hex
     */
    public class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /*
     // Method: showNoInterNetPopup
     // Description: Show popup when internet is not available
     // params: controller
     */
    public class func showNoInterNetPopup(controller:UIViewController) -> Void {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let objNoIternetPopupViewController = storyboard.instantiateViewController(withIdentifier: "NoIternetPopupViewController") as? NoIternetPopupViewController
//        objNoIternetPopupViewController?.noIternetPopupViewControllerDelegate = controller as? NoIternetPopupViewControllerDelegate
//        objNoIternetPopupViewController?.modalPresentationStyle = .fullScreen
//        if let aController = objNoIternetPopupViewController {
//            controller.present(aController, animated: true, completion: nil)
//        }
    }
    
   
    // MARK: - Save data into cache Methods
    /*
     // Method: checkIfRefreshNeededAgainst
     // Description: Check with last api call in the case of one time call in a day
     // params: key (will be api name in this project)
     // Return: Bool
     */
    public class func checkIfRefreshNeededAgainst(key:String) -> Bool {
        let userdefaults = UserDefaults.standard
        if let savedDate = userdefaults.string(forKey: key) {
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = DATE_FORMATE_STRINGS.DAY_MONTH_YEAR.rawValue
            let strCurrentDate = dateFormate.string(from: Date())
            
            if savedDate == strCurrentDate {
                return false
            }
        }
        return true
    }
    
    /*
     // Method: saveLastRefreshDateAgainst
     // Description: Save Last refresh date for api call in the case of one time call in a day
     // params: key (will be api name in this project)
     */
    public class func saveLastRefreshDateAgainst(key:String) {
        let userdefaults = UserDefaults.standard
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = DATE_FORMATE_STRINGS.DAY_MONTH_YEAR.rawValue
        let strCurrentDate = dateFormate.string(from: Date())
        userdefaults.set(strCurrentDate, forKey: key)
    }
    
    /*
     // Method: cacheAppProfileData
     // Description: Save Profile Data to UserDefaults
     // params: Model: LoginResponseModel
     */
//    public class func cacheAppProfileData(Model:LoginResponseModel) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(Model) {
//            let defaults = UserDefaults.standard
//            defaults.set(encoded, forKey: "profileData")
//        }
//    }

    /*
     // Method: retriveAppConfigDateFromCache
     // Description: Get AppConfig Data to from UserDefaults
     // params: no Params
     // Return: Model: LoginResponseModel
     */
//    public class func retriveAppProfileDateFromCache() -> LoginResponseModel? {
//        var objGetProfileModel:LoginResponseModel? = nil
//        let userDefaults = UserDefaults.standard
//        if let profileModel = userDefaults.object(forKey: "profileData") as? Data {
//            let decoder = JSONDecoder()
//            if let objProfileData = try? decoder.decode(LoginResponseModel.self, from: profileModel) {
//                objGetProfileModel = objProfileData
//            }
//            return objGetProfileModel
//        }
//        return nil
//    }

    /*
     // Method: removeProfileDataFromCache
     // Description: Remove Profile Data From Cache
     // params: no Params
     */
    public class func removeProfileDataFromCache() {
        let prefs = UserDefaults.standard
        prefs.removeObject(forKey:"profileData")
    }
    
    /*
     // Method: getGenderArray
     // Description: get gender array
     // Return: string array of gender
     */
    public class func getGenderArray() -> [String] {
        return ["Male","Female"]
    }
    
    /*
     // Method: getTypeOfSociety
     // Description: get Types Of Society
     // Return: string array of Societies
     */
    public class func getTypeOfSociety() -> [String] {
        return  ["SARL.", "SAS.", "EURL"]
    }
    
    /*
     // Method: getTypeOfContract
     // Description: get Types Of contract
     // Return: string array of contracts
     */
    public class func getTypeOfContract() -> [String] {
        return  ["Premium", "Normal"]
    }
    
    /*
     // Method: getCurentDateStringInFrence
     // Description: get current date in frunch date string
     // Return: date string in french
     */
    public class func getCurentDateStringInFrence() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "d MMM, yyyy"
        //dd-MMM-yyyy
        let date = Date()
        dateFormatter.locale = Locale(identifier: "fr")
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "d MMM, yyyy", options: 0, locale: dateFormatter.locale)
        
        let frenchDate = dateFormatter.string(from: date)
        print(frenchDate) // 12 janv. 2017
        return frenchDate
    }
    
    /*
     // Method: getCreatedDatefrom
     // Description: get Created Date from string
     // Return: date string
     */
    public class func getCreatedDatefrom(strDate:String) -> String {
        //2022-10-07T07:34:01.000000Z
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        //MM/dd/yyyy
        if let date = dateFormatter.date(from: strDate) {
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM/dd/yyyy", options: 0, locale: dateFormatter.locale)
            
            let frenchDate = dateFormatter.string(from: date)
            print(frenchDate)
            return frenchDate
        } else {
            let date = Date()
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM/dd/yyyy", options: 0, locale: dateFormatter.locale)
            
            let frenchDate = dateFormatter.string(from: date)
            print(frenchDate)
            return frenchDate
        }
    }
    
    /*
     // Method: configureGenericSettings
     // Description: Method used configure generic settings
     */
    public class func configureGenericSettings() {
        UINavigationBar.appearance().barTintColor = AppUtility.hexColor(hex: "FFFFFF")
    }
    
    /*
     // Method: getCurrentDateWithFormate
     // Description: Method used to get current date with desired formate
     */
    public class func getCurrentDateWithFormate(formate:String) -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = formate
        return df.string(from: date)
    }
    /*
     // Method: hexStringToUIColor
     // Description: Method used to get color from Hexcolor
     */
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /*
     // Method: openLoginViewController
     // Description: Method used to go to LoginViewController
     */
    public class func openLoginViewController(controller:UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let objVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        if let aController = objVC {
            let navigationController = UINavigationController(rootViewController: aController)
            navigationController.isNavigationBarHidden = true
            controller.view.window?.rootViewController = navigationController
            controller.view.window?.makeKeyAndVisible()
        }
    }
    
}


extension UITableView
{
    func register<T: UITableViewCell>(cell:T.Type){
        register(UINib(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
}
extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
