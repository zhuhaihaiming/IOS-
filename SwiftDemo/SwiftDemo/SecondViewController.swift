//
//  SecondViewController.swift
//  SwiftDemo
//
//  Created by 黄海明 on 2018/1/24.
//  Copyright © 2018年 HAL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate:FirstViewController?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button =   UIButton(type: .system)
        button.frame = CGRect(x:0, y:0, width:65, height:30)
        button.setImage(UIImage(named:"back"), for: .normal)
        button.setTitle("返回", for: .normal)
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        
        let leftBarBtn = UIBarButtonItem(customView: button)
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = -10;
        
        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]

        
        // Do any additional setup after loading the view.
    }
    //返回按钮点击响应
    @objc func backToPrevious(){
        delegate?.onNavBack(number:"黄海明")
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func backActionBn(_ sender: Any) {
//        self.navigationController?.pushViewController(viewController , animated:true)
        let myNotification = Notification.Name(rawValue:"MyNotification")
        
        let nc = NotificationCenter.default

        nc.post(name:myNotification,
                object: nil,
                userInfo:["message":"Hello there!", "date":Date()])
    
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
