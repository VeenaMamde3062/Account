//
//  FinalViewController.swift
//  Account
//
//  Created by user235115 on 3/19/23.
//

import UIKit

class FinalViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var starBtn: [UIButton]!
    @IBOutlet var squareBtn: [UIButton]!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var btechLabel: UITextField!
    @IBOutlet weak var dobLabel: UITextField!
    @IBOutlet weak var dateandtime: UITextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.delegate = self
        emailID.delegate = self
        btechLabel.delegate = self
        dobLabel.delegate = self
        dateandtime.delegate = self
    }
    @IBAction func starSelected(_ sender: UIButton) {
        var starTag = sender.tag
        for btn in starBtn{
            if btn.tag <= starTag{
                btn.setImage(UIImage(named: "star-symbol-icon.png"), for:.normal )
            }else{
                btn.setImage(UIImage(named: "star-half-yellow-icon.png"), for:.normal )
            }
        }
    }
    @IBAction func squareSelected(_ sender: UIButton) {
        var squareTag = sender.tag
        for btn in squareBtn{
            if btn.tag <= squareTag{
                btn.setImage(UIImage(named: "Group 11638.png"), for:.normal )
            }else{
                btn.setImage(UIImage(named: "Rectangle 3770.png"), for:.normal )
            }
        }
    }
    @IBAction func genderSelected(_ sender: UIButton) {
        if sender.tag == 0{
            sender.setImage(UIImage(named: "Ellipse 1032.png"), for: .normal)
            femaleBtn.setImage(UIImage(named: "Path 9461.png"), for: .normal)
        }else{
            sender.setImage(UIImage(named: "Ellipse 1032.png"), for: .normal)
            maleBtn.setImage(UIImage(named: "Path 9461.png"), for: .normal)
        }
    }
    @IBAction func submitSelected(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = btechLabel.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 4
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dobLabel{
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
            dobLabel.inputView = datePicker
//            dobLabel.inputAccessoryView = createToolbar()
            datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        }
        if textField == dateandtime{
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .time
            dateandtime.inputView = datePicker
//            dateandtime.inputAccessoryView = createToolbar()
            datePicker.addTarget(self, action: #selector(timeSelected), for: .valueChanged)
        }
    }
//    @objc func donePressed(){
//        self.view.endEditing(true)
//    }
    @objc func timeSelected(){
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        let time = dateFormatter.string(from: datePicker.date)
        dateandtime.text = time
    }
    @objc func dateSelected(){
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let date = dateFormatter.string(from: datePicker.date)
        dobLabel.text = date
    }
//    func createToolbar() -> UIToolbar{
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
//        toolbar.setItems([donebtn], animated: true)
//        return toolbar
//    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

