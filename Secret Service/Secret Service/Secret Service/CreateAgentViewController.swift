//
//  CreateAgentViewController.swift
//  Secret Service
//


import UIKit

class CreateAgentViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,UINavigationControllerDelegate {
     var appDelegate : AppDelegate?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = mission.count
        if pickerView == countryPicker {
            
            countrows = self.country.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == missionPicker {
            
            let titleRow = mission[row]
            
            return titleRow
            
        }
            
        else if pickerView == countryPicker{
            let titleRow = country[row]
            
            return titleRow
        }
        
        return ""
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == missionPicker {
            self.missionText.text = self.mission[row]
            self.missionPicker.isHidden = false
        }
            
        else if pickerView == countryPicker{
            self.countryText.text = self.country[row]
            self.countryPicker.isHidden = false
            
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.countryText){
            self.countryPicker.isHidden = false
            
        }
        else if (textField == self.missionText){
            self.missionPicker.isHidden = false
            
        }
        
    }

    @IBOutlet weak var agentname: UITextField!
    @IBOutlet weak var missionText: UILabel!
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var missionPicker: UIPickerView!
  
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var countryText: UILabel!
    var mission = ["I","R","P"]
    var country = ["India","Pakistan","brazil","China","US","Canada"]
    var Mission = String()
    var Country = String()
    var Date = String()
    @IBAction func addagent(_ sender: UIButton) {
        self.view.endEditing(true)
        
        let managedContext = appDelegate?.persistentContainer.viewContext
    
        Agent.setValue(missionText.text!,forKey: "name")
        Agent.setValue(Mission, forKey: "mission")
        Agent.setValue(Country, forKey: "country")
        Agent.setValue(Date, forKey: "date")
        
       
    }
    
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
