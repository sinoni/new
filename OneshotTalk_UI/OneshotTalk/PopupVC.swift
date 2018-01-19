//
//  PopupVC.swift
//  OneshotTalk
//
//  Created by yeeun kwon on 2018. 1. 8..
//  Copyright © 2018년 pjy. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 20
        popupView.layer.masksToBounds = true
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // View 이동
    @IBAction func back(_ sender: Any) {
        let newController: UIViewController? = self.storyboard?.instantiateViewController(withIdentifier: "identifier")
        
        self.present(newController!, animated: false, completion: nil)
    }
}
