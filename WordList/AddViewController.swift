//
//  AddViewController.swift
//  WordList
//
//  Created by takafumi oosugi on 2016/02/10.
//  Copyright © 2016年 myname. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {//最初に画面が呼び出された時どんな動作をするか決めるもの
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //NSUserDefaultsから配列の読み込み
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //保存ボタンが押された時のsaveWord()メソッドの記述
    @IBAction func saveWord() {
        let wordDictionary =
                ["english":englishTextField.text!,"japanese":japaneseTextField.text!]
        
        wordArray.append (wordDictionary)
        saveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler:nil
            )
        )
        self.presentViewController(alert, animated: true, completion:nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
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


