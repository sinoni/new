//
//  AlertVC.swift
//  OneshotTalk
//
//  Created by yeeun kwon on 2018. 1. 9..
//  Copyright © 2018년 pjy. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func copyComplete(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "복사 되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {() -> Void in
            alert.dismiss(animated: true, completion: {() -> Void in
            })
        })
    }
    
    @IBAction func saveComplete(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "저장되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {() -> Void in
            alert.dismiss(animated: true, completion: {() -> Void in
            })
        })
    }
    
    @IBAction func deleteComplete(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "삭제되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
        
        self.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {() -> Void     in
            alert.dismiss(animated: true, completion: {() -> Void in
            })
            let newController: UIViewController? = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
            
            self.present(newController!, animated: false, completion: nil)
        })
    }
    
    @IBAction func transferComplete(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "전송되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
        
        self.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {() -> Void     in
            alert.dismiss(animated: true, completion: {() -> Void in
            })
            let newController: UIViewController? = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
            
            self.present(newController!, animated: false, completion: nil)
        })
    }
    
    @IBAction func closePopup(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePopupWithoutAnimation(_ sender: Any)
    {
        dismiss(animated: false, completion: nil)
    }
    
    // 카카오 로그인화면
    @IBAction func actKakaoLogin(_ sender: Any) {
        let session = KOSession.shared()
        if let s = session {
            if s.isOpen() {
                s.close()
            }
            s.open(completionHandler: { (error) in
                if error == nil {
                    print("No error")
                    
                    if s.isOpen() {
                        print("Success")
                    }
                    else {
                        print("Fail")
                    }
                }
                else {
                    print("Error login: \(error)")
                }
            })
        }
        else {
            print("알 수 없는 오류")
        }
        KOSessionTask.talkMemoSend(withTemplateId: "7771", templateArgs: ["MESSAGE":"안녕하세요? 나와의 채팅방으로 보낸 메세지입니다.", "DATE":"2016-XX-XX(swift)"], completionHandler: { (error) -> Void in
            if let error = error as NSError? {
                print(error)
            } else {
                print(error)
            }
        })
    }
    
    // 공유하기 화면 띄우기
    @IBAction func announce(_ sender: Any) {
        print("announce call")
        
        let name = ["사람1", "사람2"]
        let textToShare = "ㅋㅋㅋㅋ"
        let sharingItems = name + [textToShare]
        
        let activityVC = UIActivityViewController(activityItems:sharingItems, applicationActivities: [CustomActivity()])
        
        /*
        activityVC.excludedActivityTypes = [UIActivityType.message, UIActivityType.print, UIActivityType.mail, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.assignToContact]
        */
        
        self.present(activityVC, animated:true, completion:nil)
    }
}
