//
//  AddIteamViewController.swift
//  Final Project
//
//  Copyright © 2017 Omar Almadani. All rights reserved.
//

import UIKit

protocol changeValueDelegate {
    func updateData(data: SimpleModel)
}

class AddIteamViewController: UIViewController {

    @IBOutlet weak var nName: UITextField!
    @IBOutlet weak var nSubTitle: UITextField!
    @IBOutlet weak var nDesc: UITextView!
    
    var delegate: changeValueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nDesc.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        nDesc.layer.borderWidth = 1.0;
        nDesc.layer.cornerRadius = 5.0;
    }

    @IBAction func iteamSave(_ sender: Any) {
        
        if nName.text == "" || nSubTitle.text == "" || nDesc.text == "" {
            
            AlertMessage(Input: "Please fill all the fields.")
            
        }else if !isValidInput(Input: nName.text!) {
            
            AlertMessage(Input: "Name field should contain Letters, Digits or Underscores are only.")
            
        }else if !isValidInput(Input: nSubTitle.text!){
            
            AlertMessage(Input: "Subtitle field should contain Letters, Digits or Underscores are only.")
            
        }else{
            
            let model = SimpleModel.init(name: nName.text!, photo: nil, subtitle: nSubTitle.text!, description: nDesc.text!);
            
            self.delegate?.updateData(data: model);
            
            _ = navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    func AlertMessage(Input:String){
        let alertController = UIAlertController(title: "Error", message: Input, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\A\\w{1,20}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
