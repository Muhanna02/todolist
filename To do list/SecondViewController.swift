//
//  SecondViewController.swift
//  To do list
//
//  Created by Mehna Almotery on 7/28/16.
//  Copyright © 2016 Mehna Almotery. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var priority: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    let pickerData = ["High", "Medium", "Low"]
    let typeData = ["Home", "Work", "Personal"]
    @IBAction func savingBtn(_ sender: AnyObject) {
        doList.append(txtField.text!)
        doDescription.append(priority.text!)
        txtField.text = ""
        UserDefaults.standard.set(doList,forKey: "doList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priority.text = pickerData[row]
    }
    
 
    
    // The number of rows of data
    func typePicker(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func typePicker(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeData[row]
    }
    
    func typePicker(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type.text = typeData[row]
    }
    
    


}

