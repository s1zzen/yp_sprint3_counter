//
//  ViewController.swift
//  yp_sprint3_counter
//
//  Created by Сергей Баскаков on 17.12.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter = 0
    
    var localDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        return dateFormatter.string(from: Date()).description
    }()
    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var logsView: UITextView!
    
    private func resizeLableScrollText() {
        mainLable.sizeToFit()
        mainLable.center = self.view.center
        let bottom = NSMakeRange(logsView.text.count - 1, 1)
        logsView.scrollRangeToVisible(bottom)
        }
    override func viewDidLoad() {
        logsView.isEditable = false
        logsView.text = "История изменений:\n\n"
        super.viewDidLoad()
    }
    @IBAction func plusAction(_ sender: Any) {
        counter += 1
        var logsString = localDate
        logsString.append(":\nзначение изменено на +1\n")
    
        mainLable.text = counter.description
        
        logsView.text.append(logsString)
        resizeLableScrollText()
    }
    @IBAction func minusAction(_ sender: Any) {
        if counter == 0{
            var logsString = localDate
            logsString.append(":\nпопытка уменьшить значение счётчика ниже 0\n")
            logsView.text.append(logsString)
            resizeLableScrollText()
            return
        }
        
        counter -= 1
        var logsString = localDate
        logsString.append(":\nзначение изменено на -1\n")
        mainLable.text = counter.description
        
        logsView.text.append(logsString)
        resizeLableScrollText()

    }
    @IBAction func resetAction(_ sender: Any) {
        counter = 0
        var logsString = localDate
        logsString.append(":\nзначение сброшено\n")
        mainLable.text = counter.description
        
        logsView.text.append(logsString)
        resizeLableScrollText()
    }
    
    

}

