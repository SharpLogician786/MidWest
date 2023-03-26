//
//  Constants.swift
//  RiyoWork
//
//  Created by MacBook Pro on 04/03/2023.
//

import Foundation
import UIKit

/*
 // enum: APIURL
 // Description: Enums for api urls and api keys
 */
enum API_URL:String {
    
    // Live Server
    case mainURL = "https://api.riyowork.com/api/"

}

//
/*
 // enum: MESSAGE
 // Description: Enums for messages for alerts
 */
enum MESSAGE: String {
    case AppHeading = "Riyo Work"
    case NoInterNetFound = "No internet found."
    case EnterEmailAddress = "Please enter email."
    case InvalidEmail = "Please enter valid email."
    case EnterPassword = "Please enter password."
    case SomeThingWentWrong = "Some thing went wrong, Please try again leter."
    case SelectLeaveType = "Please select leave type."
    case SelectFromDate = "Please select from date."
    case SelectToDate = "Please select to date."
    case LeaveReason = "Please enter leave reason."
    case CreateLeave = "Leave applied successfully."
    case Shift_Schaduale = "No data found."
    case Not_Login = "You are login currently."
    case No_Company = "Company does not exist."
    case No_Profile = "Your"
  
}

/*
 // enum: APIName
 // Description: Enums for api names
 */
enum API_NAME:String {
    case LOGIN = "v1/auth/login"
    case GET_CLOCK_BY_DAY_IDENTIFIER  = "v1/clock/getClockByDayIdentifier"
    case GET_SHIFT_BY_USER_ID = "v1/shift/getShiftByUserId"
    case CLOCK_IN = "v1/clock/clockIn"
    case UPDATE_CLOCK = "v1/clock/updateClock"
    case GET_LEAVE_BY_USERID = "v1/leave/getLeaveByUserId"
    case GET_ALL_TRAINING = "v1/training/getAllTraining"
    case REFRESH_TOKEN = "v1/auth/refresh-tokens"
    case MONTHLY_CLOCK_STATUS_BY_ID = "v1/clock/monthlyClockStatusById"
    case GET_CLOCK_BY_MONTHLY_YEAR_AND_USER_ID = "v1/clock/getClocksByMonthYearAndUserId"
    case GET_CLOCK_BY_ID = "v1/clock/getClockById"
    case GET_SHIFT_BY_USER_ID_DIFF_VIEWS = "v1/shift/getShiftByUserIdDiffViews"
    case CREATE_LEAVE = "v1/leave/createLeave"
    case EMPLOYMENT_ANNIVERSARY = "v1/users/employmentAnnivarsary"
    case USER_RECENT_FILES = "v1/filemanager/userRecentFiles"

}


/*
 // enum: DateFormateStrings
 // Description: Enums for Date formate used in projects
 */
enum DATE_FORMATE_STRINGS:String {
    case DAY_MONTH_YEAR = "dd/MM/yyyy"
    case YEAR_MONTH_DATE = "yyyy-MM-dd"
}


/*
 // enum: DeviceType
 // Description: Enums for Device type sending in params
 */
enum DEVICE_TYPE:String {
    case IOS = "ios"
}

/*
 // enum: PLACEHOLDER_IMAGE
 // Description: Enums for image placeholdes name
 */
enum PLACEHOLDER_IMAGE:String {
    case userProfilePlaceholder = "ic_userProfile"
   
}

/*
 // enum: SOCIALURL
 // Description: Enums for social links
 */
enum SOCIAL_URL:String {
    case instagramURL = "https://www.instagram.com/"
    
}

/*
 // enum: UtilityInformation
 // Description: Struct for utility information
 */

struct UtilityInformation {
    var title:String = ""
    var name:String = ""
}

 
