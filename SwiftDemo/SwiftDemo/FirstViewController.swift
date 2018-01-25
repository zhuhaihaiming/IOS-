//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 黄海明 on 2018/1/24.
//  Copyright © 2018年 HAL. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myNotification = Notification.Name(rawValue:"MyNotification")

        let nc = NotificationCenter.default

        nc.addObserver(forName:myNotification, object:nil, queue:nil, using:catchNotification)


        // Do any additional setup after loading the view, typically from a nib.
    }
    func catchNotification(notification:Notification) -> Void {
        print("Catch notification")
        //guard语句和if语句有点类似，都是根据其关键字之后的表达式的布尔值决定下一步执行什么。但与if语句不同的是，guard语句只会有一个代码块，不像if语句可以if else多个代码块。
        //userInfo变量的作用域是在整个方法体内
        //guard方法可以自动解包
        guard let userInfo = notification.userInfo,
            let message = userInfo["message"] ,
            let date = userInfo["date"] else {
                print("No userInfo found in notification")
                return
        }
        
        //提醒框
        let alert = UIAlertController(title: "Notification!",
                                      message:"\(message) received at \(date)",
            preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        

    }
    @IBOutlet var bnAction: UIButton!
    
    @IBAction func haha(_ sender: Any) {

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "secondID") as! SecondViewController
        viewController.delegate=self;
        self.navigationController?.pushViewController(viewController , animated:true)
        
    }
    func onNavBack(number:String){
        print(number)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

