//
//  OnWebViewController.swift
//  KinNumPicker
//
//  Created by Rentaro on 2020/01/29.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit
import SafariServices

class OnWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Webページを表示させるための処理
        let url = URL(string: "http://mayareki.biz/evryday-happy/your-kin/")
        if let url = url {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func oneMoreTapped(_ sender: UIButton) {
        self.viewDidLoad()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
