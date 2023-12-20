//
//  ViewController.swift
//  yp_sprint3_counter
//
//  Created by Сергей Баскаков on 17.12.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter = 0
    
    private var localDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        return dateFormatter.string(from: Date()).description
    }()
    
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var logsView: UITextView!
    
    private func resizeLabelAndAutoScrollingText() {
        mainLabel.sizeToFit()
        mainLabel.center = self.view.center
        let bottom = NSMakeRange(logsView.text.count - 1, 1)
        logsView.scrollRangeToVisible(bottom)
    }
    override func viewDidLoad() {
        logsView.isEditable = false
        logsView.text = "История изменений:\n\n"
        
        super.viewDidLoad()
    }
    @IBAction private func plusAction(_ sender: Any) {
        counter += 1
        var logsString = localDate
        logsString.append(":\nзначение изменено на +1\n\n")
        
        mainLabel.text = counter.description
        
        logsView.text.append(logsString)
        resizeLabelAndAutoScrollingText()
    }
    @IBAction private func minusAction(_ sender: Any) {
        if counter == 0{
            var logsString = localDate
            logsString.append(":\nпопытка уменьшить значение счётчика ниже 0\n\n")
            logsView.text.append(logsString)
            resizeLabelAndAutoScrollingText()
            return
        }
        
        counter -= 1
        var logsString = localDate
        logsString.append(":\nзначение изменено на -1\n\n")
        mainLabel.text = counter.description
        
        logsView.text.append(logsString)
        resizeLabelAndAutoScrollingText()
        
    }
    @IBAction private func resetAction(_ sender: Any) {
        counter = 0
        var logsString = localDate
        logsString.append(":\nзначение сброшено\n\n")
        mainLabel.text = counter.description
        
        logsView.text.append(logsString)
        resizeLabelAndAutoScrollingText()
    }
    
    
    
}

