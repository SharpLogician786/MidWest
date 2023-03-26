//
//  WebserviceClient.swift
//  RiyoWork
//
//  Created by MacBook Pro on 04/03/2023.
//

import Foundation
import AVFoundation
import Alamofire
import SwiftyJSON

class WebserviceClient: NSObject {
    
    override init() {
        
    }
    
    /*
     // Method: webservicesURL
     // Description: Method to get Base URL string
     // Param: Hex color string without #
     */
    public class func webservicesURL() -> String {
        return API_URL.mainURL.rawValue
    }
    
    /*
     // Method: serviceCallAccordingToModel
     // Description: POST method call with params according to response model
     // Param: parameters,methodName
     // Reture: result, error
     */
    public class func serviceCallAccordingToModel(_ parameters: Dictionary<String, Any>, methodName: String, completionHandler: @escaping (_ result: Data?, _ error: Error?) -> Void) {
       
        let queryURL = String(format: "%@%@", self.webservicesURL(),methodName)
        
        var header: HTTPHeaders = [:]
        let objLoginResponseModel = AppUtility.retriveAppProfileDateFromCache()
       
        if objLoginResponseModel != nil {
            let bearerToken = String(format: "Bearer %@", objLoginResponseModel?.tokens?.access?.token ?? "")
            
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : bearerToken
            ]
        } else {
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
        print(parameters)
        
        AF.request(queryURL, method: .post, parameters: parameters, encoding: JSONEncoding.default,headers:header).responseJSON { (response) in
            switch response.result {
                
            case .success(let json):
                let jsonData = json
                print(jsonData)
                completionHandler(response.data ,nil)
                
            case .failure(let error):
                completionHandler(nil,error)
            }
        }
    }
    
    /*
     // Method: serviceGetCallAccordingToModel
     // Description: GET method call according to response model
     // Param: methodName
     // Reture: result, error
     */
    public class func serviceGetCallAccordingToModel(methodName: String, completionHandler: @escaping (_ result: Data?, _ error: Error?) -> Void) {
        let queryURL = String(format: "%@%@", self.webservicesURL(),methodName)
        
        var header: HTTPHeaders = [:]
        let objLoginResponseModel = AppUtility.retriveAppProfileDateFromCache()
        if objLoginResponseModel != nil {
            let bearerToken = String(format: "Bearer %@", objLoginResponseModel?.tokens?.access?.token ?? "")
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : bearerToken
            ]
        } else {
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
        
        AF.request(queryURL,method: .get, encoding: JSONEncoding.default,headers: header).responseJSON { (response) in
            switch response.result
            {
            case .success(let json):
                let jsonData = json
                print(jsonData)
                completionHandler(response.data ,nil)
            case .failure(let error):
                completionHandler(nil,error)
            }
        }
        
    }
    
    /*
     // Method: serviceCallAccordingToModel
     // Description: Multipart POST method call with params according to response model
     // Param: parameters,methodName,image
     // Reture: result, error
     */
    public class func serviceCallForMultipartAccordingToModel(_ parameters: Dictionary<String, Any>, image: UIImage?, imageName:String, methodName: String, completionHandler: @escaping (_ result: Data?, _ error: Error?) -> Void) {
        let queryURL = String(format: "%@%@", self.webservicesURL(),methodName)
        
        var header: HTTPHeaders = [:]
        let objLoginResponseModel = AppUtility.retriveAppProfileDateFromCache()
        if objLoginResponseModel != nil {
            let bearerToken = String(format: "Bearer %@", objLoginResponseModel?.tokens?.access?.token ?? "")
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : bearerToken
            ]
        } else {
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
        print(parameters)
        
        AF.upload(
            multipartFormData: { MultipartFormData in
                if let imgData1 = image?.jpegData(compressionQuality:0.9) {
                    MultipartFormData.append(imgData1, withName: imageName,fileName: "\(imageName).jpg", mimeType: "image/jpeg")
                }
                
                for (key, value) in parameters {
                    MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
            }, to: queryURL, headers: header).responseJSON { (response) in
                
                switch response.result
                {
                case .success(let json):
                    let jsonData = json
                    print(jsonData)
                    completionHandler(response.data ,nil)
                case .failure(let error):
                    completionHandler(nil,error)
                }
            }
    }
    
    /*
     // Method: serviceCallForDocumentUploadAccordingToModel
     // Description: Multipart POST method call with params according to response model
     // Param: parameters,methodName,image
     // Reture: result, error
     */
    public class func serviceCallForDocumentUploadAccordingToModel(_ parameters: Dictionary<String, Any>, image: UIImage?, methodName: String, completionHandler: @escaping (_ result: Data?, _ error: Error?) -> Void) {
        let queryURL = String(format: "%@%@", self.webservicesURL(),methodName)
        
        var header: HTTPHeaders = [:]
        let objLoginResponseModel = AppUtility.retriveAppProfileDateFromCache()
        if objLoginResponseModel != nil {
            let bearerToken = String(format: "Bearer %@", objLoginResponseModel?.tokens?.access?.token ?? "")
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : bearerToken
            ]
        } else {
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
        print(parameters)
        
        AF.upload(
            multipartFormData: { MultipartFormData in
                if let imgData1 = image?.jpegData(compressionQuality:0.9) {
                    MultipartFormData.append(imgData1, withName: "documet",fileName: "documet.jpg", mimeType: "image/jpeg")
                }
                
                for (key, value) in parameters {
                    MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
            }, to: queryURL, headers: header).responseJSON { (response) in
                
                switch response.result
                {
                case .success(let json):
                    let jsonData = json
                    print(jsonData)
                    completionHandler(response.data ,nil)
                case .failure(let error):
                    completionHandler(nil,error)
                }
            }
    }
    
    /*
     // Method: serviceCallAccordingToModel
     // Description: Multipart POST method call with params according to response model
     // Param: parameters,methodName,image
     // Reture: result, error
     */
    public class func serviceCallForMultipartToUploadPublication(_ parameters: Dictionary<String, Any>, image1: UIImage?, image2: UIImage?, image3: UIImage?, methodName: String, completionHandler: @escaping (_ result: Data?, _ error: Error?) -> Void) {
        let queryURL = String(format: "%@%@", self.webservicesURL(),methodName)
        
        var header: HTTPHeaders = [:]
        let objLoginResponseModel = AppUtility.retriveAppProfileDateFromCache()
        if objLoginResponseModel != nil {
            let bearerToken = String(format: "Bearer %@", objLoginResponseModel?.tokens?.access?.token ?? "")
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : bearerToken
            ]
        } else {
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
        print(parameters)
        
        AF.upload(
            multipartFormData: { MultipartFormData in
                if let imgData1 = image1?.jpegData(compressionQuality:0.9) {
                    MultipartFormData.append(imgData1, withName: "publication_image1",fileName: "profileImage.jpg", mimeType: "image/jpeg")
                }
                
                if let imgData2 = image2?.jpegData(compressionQuality:0.9) {
                    MultipartFormData.append(imgData2, withName: "publication_image2",fileName: "profileImage.jpg", mimeType: "image/jpeg")
                }
                
                if let imgData3 = image3?.jpegData(compressionQuality:0.9) {
                    MultipartFormData.append(imgData3, withName: "publication_image3",fileName: "profileImage.jpg", mimeType: "image/jpeg")
                }
                
                for (key, value) in parameters {
                    MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
            }, to: queryURL, headers: header).responseJSON { (response) in
                
                switch response.result
                {
                case .success(let json):
                    let jsonData = json
                    print(jsonData)
                    completionHandler(response.data ,nil)
                case .failure(let error):
                    completionHandler(nil,error)
                }
            }
    }
    
    /*
     // Method: stopPreviousNetworkCalls
     // Description: Method to stop all Api's Request
     // Param: no params
     */
    public class func stopPreviousNetworkCalls() {
        AF.cancelAllRequests()
    }
    
    /*
     // Method: createHash
     // Description: Method to create hash for request
     // Param: strKeyForConcat
     */
    public class func createHash(strKeyForConcat:String) -> String {
        //apiKey
        return ""
    }
  
    /*
     // Method: refreshToken
     // Description: Method to refresh the token
     // Param: No Parmas
     */
    public class func refreshToken() {
        let queryURL = String(format: "%@%@", self.webservicesURL(),API_NAME.REFRESH_TOKEN.rawValue)
        
        var header: HTTPHeaders = [:]
        let objLoginResponseModel = AppUtility.retriveAppProfileDateFromCache()
        if objLoginResponseModel != nil {
            let bearerToken = String(format: "Bearer %@", objLoginResponseModel?.tokens?.access?.token ?? "")
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization" : bearerToken
            ]
        } else {
            header = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
        
        let params = ["refreshToken":objLoginResponseModel?.tokens?.refresh?.token ?? ""]
        print(params)
        
        AF.request(queryURL, method: .post, parameters: params, encoding: JSONEncoding.default,headers:header).responseJSON { (response) in
            switch response.result
            {
            case .success(let json):
                let jsonData = json
                print(jsonData)
                guard let data = response.data else { return }
                print(String(data: data, encoding: .utf8)!)
                do {
                    //Decode dataResponse received from a network request
                    let decoder = JSONDecoder()
                    let objRefreshTokenModel = try decoder.decode(RefreshTokenModel.self, from: data) //Decode JSON Response Data
                     print("Got the data")
                     
                    var objUserData = AppUtility.retriveAppProfileDateFromCache()
                    
                    objUserData?.tokens?.access?.token = objRefreshTokenModel.access?.token ?? ""
                    objUserData?.tokens?.refresh?.token = objRefreshTokenModel.refresh?.token ?? ""
                    
                    if let userData = objUserData {
                        AppUtility.cacheAppProfileData(Model: userData)
                    }
                    
                } catch let parsingError {
                    print("Error", parsingError)
                    
                }
                
            case .failure(let error):
                break
            }
        }
    }
    
}
