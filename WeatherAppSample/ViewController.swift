//
//  ViewController.swift
//  WeatherAppSample
//
//  Created by 天野修一 on 2020/11/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        createTimePicker()


    }

    //class変数
    let timePicker = UIDatePicker()
    

    
    
    //ピッカーの設定
    func createTimePicker() {
        //ツールバー
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //バーボタン
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        //assign
        timeTextField.inputAccessoryView = toolbar
        
        // timePickerをtimeTextFieldに反映
        timeTextField.inputView = timePicker
        
        //datePickerのモード選択(西暦、曜日、日付などを)
        timePicker.datePickerMode = .time
        
        //ベーシックな型
        timePicker.preferredDatePickerStyle = .wheels
        
        //時間をJapanese(24時間表記)に変更
        timePicker.locale = Locale.init(identifier: "Japanese")
        
        //10分単位
        timePicker.minuteInterval = 10
        
    }
    
    
    //doneButtonが押された時のfunc
    @objc func donePressed() {
        
        //時間設定のフォーマット
        let formatter = DateFormatter()
        
        //日付は関係ないので.none
        formatter.dateStyle = .none
        
        formatter.dateFormat = "hh:mm"
        //何時何分か分かればいいので.short
        formatter.timeStyle = .short
        
        formatter.locale = Locale.init(identifier: "japanese")
        
        
        //pickerの時刻をテキストフィールドに写す
        timeTextField.text = formatter.string(from: timePicker.date)
        timeTextField.textAlignment = .center
        
        //timePicker(toolbar)を終了
        self.view.endEditing(true)
    }
    
    
    //テキストフィールド
    @IBOutlet var timeTextField: UITextField!
    
        
    //更新ボタンが押されたとき
    @IBAction func updateButton(_ sender: Any) {
        
        let selectedTime:String = timeTextField.text ?? ""
        
        print(selectedTime)
    }
    
    
}

