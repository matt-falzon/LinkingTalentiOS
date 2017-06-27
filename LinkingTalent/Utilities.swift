//
//  Utilities.swift
//  ChaChat
//
//  Created by Matthew Falzon on 2017-06-23.
//  Copyright © 2017 Matthew Falzon. All rights reserved.
//

import Foundation
import UIKit
class Utilities {
    
    func ShowAlert(title: String, message: String, vc: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func getDate () -> String
    {
        let today: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        return dateFormatter.string(from: today)
    }
    
    
}
