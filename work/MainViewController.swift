//
//  MainViewController.swift
//  work
//
//  Created by imac-2626 on 2024/7/11.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var vScreen: UIView!
    
    @IBOutlet weak var sldGreen: UISlider!
    @IBOutlet weak var sldBlue: UISlider!
    @IBOutlet weak var sldRed: UISlider!
    
    @IBOutlet weak var txfBlue: UITextField!
    @IBOutlet weak var txfGreen: UITextField!
    @IBOutlet weak var txfRed: UITextField!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfRed.delegate=self
        txfGreen.delegate=self
        txfBlue.delegate=self
        txfRed.text="0"
        txfBlue.text="0"
        txfGreen.text="0"
       
    }
    
    // MARK: - IBAction
    
    // MARK: - Function
    @IBAction func Changcolor(_ render:UISlider){
        vScreen.backgroundColor=UIColor( red:CGFloat((sldRed.value/255)),
                                         green: CGFloat((sldGreen.value/255)),
                                         blue: CGFloat((sldBlue.value/255)),
                                         alpha: 1
        )
    }
    @IBAction func Changtext(_ render:UITextField){
        if let redValue=Float(txfRed.text ?? ""),
           let greenValue=Float(txfGreen.text ?? ""),
           let blueValue=Float(txfBlue.text ?? ""){
            let red=CGFloat(redValue/255.0)
            let green=CGFloat(greenValue/255.0)
            let blue=CGFloat(blueValue/255.0)
            vScreen.backgroundColor=UIColor(red:red,green: green,blue:blue,alpha:1.0)
        }
    }
    @IBAction func textnumber(_ render:UISlider){
        txfRed.text="\(Int(sldRed.value))"
        txfGreen.text="\(Int(sldGreen.value))"
        txfBlue.text="\(Int(sldBlue.value))"
    }
    
    @IBAction func updatar(_ render:UITextField){
        let new_redtext:Float,new_greentext:Float,new_bluetext:Float
        if let red_str_text=txfRed.text{
            if let red_f_text=Float(red_str_text){
                if red_f_text>=255.0{
                    new_redtext=255.0
                }else if red_f_text<=0.0{
                    new_redtext=0
                }else{
                    new_redtext=red_f_text
                }
                txfRed.text="\(Int(new_redtext))"
                sldRed.setValue(new_redtext, animated: true)
            }
        }
        if let green_str_text=txfGreen.text{
            if let green_f_text=Float(green_str_text){
                if green_f_text>=255.0{
                    new_greentext=255.0
                }else if green_f_text<=0.0{
                    new_greentext=0.0
                }else{
                    new_greentext=green_f_text
                }
                txfGreen.text="\(Int(new_greentext))"
                sldGreen.setValue(new_greentext, animated: true)
            }
        }
        if let blue_str_text=txfBlue.text{
            if let blue_f_text=Float(blue_str_text){
                if blue_f_text>=255.0{
                    new_bluetext=255.0
                }else if blue_f_text<=0.0{
                    new_bluetext=0.0
                }else{
                    new_bluetext=blue_f_text
                }
                txfBlue.text="\(Int(new_bluetext))"
                sldBlue.setValue(new_bluetext, animated: true)
            }
        }
        
        
        
    }
}

// MARK: - Extensions

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField:UITextField,shouldChangeCharactersIn range:NSRange,replacementString string:String) -> Bool{
        let len=string.lengthOfBytes(using: String.Encoding.utf8)
        for i in 0..<len{
            let chare=(string as NSString).character(at: i)
            if(chare<48){
                textField.text="0"
                return false
            }
            if(chare>57){
                textField.text="0"
                return false
            }
        }
        return true
    }
}



