//
//  CryptoCoinRouterProtocol.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

@MainActor protocol CryptoRouterProtocol: AnyObject { 
    
    var initialViewController: UIViewController { get }
        
    func displayError(title: String, message: String, retryAction: (()->Void)?)
}

