//
//  BaseViewController.swift
//  NotesApp
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD
import MJSnackBar
class BaseViewController: UIViewController , Routable{
    let hud = JGProgressHUD(style: .dark)
    var snackBar: MJSnackBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        hud.textLabel.text = "Loading"
        snackBar = MJSnackBar(onView: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hud.textLabel.text = "Loading"
        snackBar = MJSnackBar(onView: self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showLoadingDialog(){
        
        hud.show(in: self.view)
    }
    
    func hideLoadingDialog()  {
        hud.dismiss(afterDelay: 3.0)
        
    }
    
    func showSnackBar(_ msg:String){
        let data = MJSnackBarData(withIdentifier: 12, message: msg, andActionMessage: nil, objectSaved: nil)
        snackBar?.show(data: data, onView: self.view)
        
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
  

    
}
