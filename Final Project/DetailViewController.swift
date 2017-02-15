//
//  DetailViewController.swift
//  Final Project
//
//  Copyright © 2017 Omar Almadani. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {

    var model : SimpleModel?
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userDesc: UITextView!
    @IBOutlet weak var userSubtitle: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userDesc.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        userDesc.layer.borderWidth = 1.0;
        userDesc.layer.cornerRadius = 5.0;
        userName.text = model?.name
        userDesc.text = model?.description
        userImage.image = model?.photo
        userSubtitle.text = model?.subtitle
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

