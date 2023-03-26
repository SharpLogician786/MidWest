//
//  NetworkManager.swift
//  RiyoWork
//
//  Created by MacBook Pro on 04/03/2023.
//

import UIKit
import Foundation
import Reachability

class NetworkManager: NSObject {
    
    var reachability: Reachability!
    
    /*
     // Method: sharedInstance
     // Description: Create a singleton instance
     */
    static let sharedInstance: NetworkManager = { return NetworkManager() }()
    
    /*
     // Method: init
     // Description: Initialise reachability
     */
    override init() {
        super.init()
        
        // Initialise reachability
        do {
            // Create audio player object
            try  reachability = Reachability()
        }
        catch {
            // Couldn't create audio player object, log the error
            print("Couldn't Initialise reachability")
        }
        
        
        // RegiisUnreachablever for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    /*
     // Method: networkStatusChanged
     // Description: chnage network status notifier
     */
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    /*
     // Method: stopNotifier
     // Description: Stop the network status notifier
     */
    static func stopNotifier() -> Void {
        do {
            // Stop the network status notifier
            try (NetworkManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    /*
     // Method: isReachable
     // Description: Network is reachable
     */
    static func isReachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection != .unavailable {
            completed(NetworkManager.sharedInstance)
        }
    }
    
    /*
     // Method: isUnreachable
     // Description: Network is unreachable
     */
    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .unavailable {
            completed(NetworkManager.sharedInstance)
        }
    }
    
    /*
     // Method: isReachableViaWWAN
     // Description: Network is reachable via WWAN/Cellular
     */
    static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .cellular {
            completed(NetworkManager.sharedInstance)
        }
    }
    
    /*
     // Method: isReachableViaWiFi
     // Description: Network is reachable via WiFi
     */
    static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .wifi {
            completed(NetworkManager.sharedInstance)
        }
    }
    
}
