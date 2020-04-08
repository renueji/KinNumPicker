//
//  ResultViewController.swift
//  KinNumPicker
//
//  Created by Rentaro on 2020/01/29.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //生年月日を受け取るための変数
    var seinen: String = "年月日"
    
    //生年月日を格納するための変数
    var umareDoshi: String = "2"
    var umareDuki: String = "2"
    var umareBi: String = "2"
    
    //kinナンバーと、計算後のkinナンバーを格納するための変数
    var kin1 = 0
    var num = 0
    var saishuuKin = 0


//生まれ月をキーに、最上段のkinナンバーをバリューにした、処理の基準となる辞書
    let numbers = [1:62, 2:93, 3:121, 4:152, 5:182, 6:213, 7:243, 8:14, 9:45, 10:75, 11:106, 12:136]
    
    //ラベルをコードと接続
    @IBOutlet weak var umareLabel: UILabel!
    @IBOutlet weak var kinNum: UILabel!
    @IBOutlet weak var kagamiKin: UILabel!
    @IBOutlet weak var reverseKin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ラベルの幅を調整
        self.umareLabel.adjustsFontSizeToFitWidth = true
        self.kagamiKin.adjustsFontSizeToFitWidth = true
        self.reverseKin.adjustsFontSizeToFitWidth = true
        //生年月日を「/」で切り分けて配列に格納
        let umareRetsu:[String] = seinen.components(separatedBy: "/")
        
        //配列の値をそれぞれ文字列で保持
        self.umareDoshi = umareRetsu[0]
        self.umareDuki = umareRetsu[1]
        self.umareBi = umareRetsu[2]
        
        //上の配列の値をInt型に変換
        let intumareDoshi = Int(umareDoshi)!
        let intumareDuki = Int(umareDuki)!
        let intumareBi = Int(umareBi)!
        
        //生まれ年が1962年よりも小さい場合の処理
        if intumareDoshi < 1962 {
            //kinナンバーを求めるための計算
            //生まれ年から基準年を引き、その差分を求めたあと…
            //その差分に掛け算をし、生まれ月を基準とした辞書の数字（基準値）を足す
            let kake = intumareDoshi - 1910
            let kin1:Int = (105 * kake) + numbers[intumareDuki]!
            
//          //kinナンバーが260よりも大きくなってしまった場合のために、260で除算する
            self.num = kin1 % 260
            
            //求めたナンバーを、ラベルとテキストに表示
            self.umareLabel.text = "\(umareDoshi)年\(umareDuki)月\(umareBi)日生まれの"
            self.saishuuKin = num + intumareBi
            self.kinNum.text = "kin\(saishuuKin)です！"
            
            //鏡kinと絶対反対kinをらラベルに表示
            self.kagamiHandtai()
            
            return
            
            //生まれ年が2014年よりも小さいときの処理
        } else if intumareDoshi < 2014 {
            //同様の処理
            let kake = intumareDoshi - 1962
            let kin1:Int = (105 * kake) + numbers[intumareDuki]!
            
            self.num = kin1 % 260
            
            self.umareLabel.text = "\(umareDoshi)年\(umareDuki)月\(umareBi)日生まれの"
            
            self.saishuuKin = num + intumareBi
            self.kinNum.text = "kin\(saishuuKin)です！"
            
            self.kagamiHandtai()
            
            return
            
            //生まれ年が2066年よりも小さいときの処理
        } else if intumareDoshi < 2066 {
            //同様の処理
            let kake = intumareDoshi - 2014
            let kin1:Int = (105 * kake) + numbers[intumareDuki]!
            
            self.num = kin1 % 260

            self.umareLabel.text = "\(umareDoshi)年\(umareDuki)月\(umareBi)日生まれの"
            
            self.saishuuKin = num + intumareBi
            self.kinNum.text = "kin\(saishuuKin)です！"
            
            self.kagamiHandtai()
    
            
            return
            
        } else {
            print("エラーです")
        }
        
    }
    // Do any additional setup after loading the view.
    
    //鏡kinと絶対反対kinを出すためのメソッド
    func kagamiHandtai() {
        let mirrorKin = 261 - saishuuKin
        let hantaiKin = (num + 130) % 260
        
        self.kagamiKin.text = "kin\(mirrorKin)です！"
        self.reverseKin.text = "kin\(hantaiKin)です！"
    }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


