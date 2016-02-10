//
//  QuestionViewController.swift
//  WordList
//
//  Created by takafumi oosugi on 2016/02/10.
//  Copyright © 2016年 myname. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var nextButton:UIButton! //13~15行目はパーツの宣言
    @IBOutlet var questionLabel:UILabel!
    @IBOutlet var answerLabel:UILabel!
    
    var isAnswered:Bool=false//回答したか次の問題に行くかの判定
    var wordArray:[AnyObject]=[]//ユーザデフォルトからとる配列
    var shuffledWordArray:[AnyObject]=[]//シャッフルされた配列
    var nowNumber:Int=0//現在の回答数
    
    let saveData=NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {//画面が最初に呼び出された時にどんな動作をするか決めるもの
        super.viewDidLoad()
        answerLabel.text=""

        // Do any additional setup after loading the view.
    }
    //viewが現れた時に呼ばれる
    override func viewWillAppear(animated:Bool){
        wordArray=saveData.arrayForKey("WORD")!
        //問題シャッフル
        shuffle()
        questionLabel.text=shuffledWordArray[nowNumber]["english"] as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //配列をランダムにシャッフルするメソッド
    @IBAction func shuffle(){
        while wordArray.count>0{
            let index=Int(rand()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
        }
    }
    //”次へ”のボタンを押した時のメソッド
    @IBAction func nextButtonPushed(){
    
    //回答したか
    if isAnswered{
    //次の問題へ
    nowNumber++
    answerLabel.text=""
    
    //次の問題を表示するか
    if nowNumber<shuffledWordArray.count{
        //次の問題表示
        questionLabel.text=shuffledWordArray[nowNumber]["english"] as? String
        //isAnsweredをfalseに,回答したかしてないかの判定
        isAnswered=false
        //ボタンのタイトルを変更
        nextButton.setTitle("答えを表示",forState:UIControlState.Normal)
        }else{
            //これ以上表示する問題はないので、Finishビューに画面遷移
            self.performSegueWithIdentifier("toFinishView", sender: nil)
        }
    }else{
        //答えを表示する
        answerLabel.text=shuffledWordArray[nowNumber]["japanese"] as? String
        //isAnsweredをtrueにする
        isAnswered=true
        //ボタンのタイトル変更
        nextButton.setTitle("次へ",forState:UIControlState.Normal)
        
        }
    }
    
    }



    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
