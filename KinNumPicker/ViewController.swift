//
//  ViewController.swift
//  KinNumPicker
//
//  Created by Rentaro on 2020/01/29.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ラベルとデイトピッカーとボタンをコードと接続
    @IBOutlet weak var bdLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var kinbutton: UIButton!
    
    //日付を2パターン、違う形で格納するための変数
    var hiduke: String = "年月日"
    var hiduke2: String = "20/01/29"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンの外見を変更
        kinbutton.layer.cornerRadius = 10
        kinbutton.setTitle("Kinナンバーを調べる", for: .highlighted)
        kinbutton.layer.borderWidth = 3
        kinbutton.layer.borderColor = UIColor.blue.cgColor
        kinbutton.contentVerticalAlignment = .fill
        kinbutton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        // Do any additional setup after loading the view.
    }
    
    //デイトピッカーの挙動の設定
    @IBAction func birthDaySelect(_ sender: UIDatePicker) {
        //デイトピッカーが選択されたときの処理
        self.bdLabel.text = "私は\(self.format(date: datePicker.date))生まれです。"
        self.hiduke = self.format(date: datePicker.date)
        self.hiduke2 = self.format2(date: datePicker.date)
    }
    
    //デイトピッカーのデータをフォーマットする処理その①
    func format(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "ja_JP")
        dateformatter.setLocalizedDateFormatFromTemplate("yMMMd")
        let mojijikan = dateformatter.string(from: date)

        return mojijikan

    }
    
    //デイトピッカーのデータをフォーマットするする処理その②
    func format2(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "ja_JP")
        dateformatter.setLocalizedDateFormatFromTemplate("yMd")
        let mojijikan = dateformatter.string(from: date)

        return mojijikan

    }
    
    //画面遷移処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面にデータを渡す
        if let controller = segue.destination as? ResultViewController {
            controller.seinen = self.hiduke2
        }
    }
    
}

