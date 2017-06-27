//
//  LoginViewController.swift
//  LinkingTalent
//
//  Created by Matthew Falzon on 2017-06-26.
//  Copyright © 2017 Matthew Falzon. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBAction func OnClickLogin(_ sender: Any) {
        if(!checkInput()){
            return
        }
        let email = tfEmail.text
        let password = tfPassword.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if let error = error{
                Utilities().ShowAlert(title: "error", message: error.localizedDescription, vc: self)
                print(error.localizedDescription)
                return
            }
            print("Signed in")
            self.login()
        }
    }
    
    func login(){
        if(Auth.auth().currentUser?.uid != nil)
        {
            performSegue(withIdentifier: "LoginSegue", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkInput () -> Bool
    {
        if ((tfEmail.text?.characters.count)! < 5){
            tfEmail.backgroundColor = UIColor.init(displayP3Red: 0.8, green: 0, blue: 0, alpha: 0.2)
            return false
        }
        else{
            tfEmail.backgroundColor = UIColor.white
        }
        if ((tfPassword.text?.characters.count)! < 5){
            tfPassword.backgroundColor = UIColor.init(displayP3Red: 0.8, green: 0, blue: 0, alpha: 0.2)
            return false
        }
        else{
            tfPassword.backgroundColor = UIColor.white
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let jobBoardViewController = segue.destination as! UINavigationController
    }
    

}
