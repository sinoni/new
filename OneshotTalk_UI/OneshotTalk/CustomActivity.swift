//
//  CustomActivity.swift
//  OneshotTalk
//
//  Created by yeeun kwon on 2018. 1. 19..
//  Copyright © 2018년 pjy. All rights reserved.
//

class CustomActivity: UIActivity {
    
    // returns activity title
    override var activityTitle: String?{
        return "MyActivity"
    }
    
    //thumbnail image for the activity
    override var activityImage: UIImage?{
        return UIImage(named: "")
    }
    
    //activity type
    override var activityType: UIActivityType{
        return UIActivityType.message
    }
    
    //view controller for the activity
    override var activityViewController: UIViewController?{
        print("아이콘 클릭했음")
        return nil
    }
    
    //here check whether this activity can perform with given list of items
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    //prepare the data to perform with
    override func prepare(withActivityItems activityItems: [Any]) {
            
    }
}
