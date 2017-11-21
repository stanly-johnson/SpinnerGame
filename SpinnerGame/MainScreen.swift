//
// MainScreen.swift
//  SpinnerGame
//
//  Created by Stanly on 21/11/17.
//  Copyright © 2017 Stanly. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet var fullScoreView: UIView!
    
    var randomValue = Int()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionSubmitButtonTapped(_ sender: Any)
    {
        
       guard let inputValue = Int(userTextField.text!) else {
            print("error in retreiving value")
            return
        }
        
        let score = scoreCalc(guess: inputValue)
        
        
        if(score == 100)
        {
            self.view.endEditing(true)
            self.fullScoreView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.view.addSubview(self.fullScoreView)
            //sleep(50)
            //fullScoreView.removeFromSuperview()
            UIView.animate(withDuration: 1, animations: {
                self.fullScoreView.frame.origin.y = -20
            }, completion: nil)
        }
        
        else
        {
            let alert = UIAlertController(title: "You have scored \(score)%", message: "The original value was \(randomValue)" , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    @IBAction func actionResetButtonTapped(_ sender: Any)
    {
        initGame()
    }


    
    @IBAction func actionExitView(_ sender: Any)
    {
        fullScoreView.removeFromSuperview()
    }
    
    func scoreCalc(guess : Int) -> Int
    {
        let diff = abs(guess - randomValue)
        return (100 - diff)
    }
    
    func initGame()
    {
        randomValue = 1 + (Int(arc4random()) % 100)
        slider.setValue(Float(randomValue), animated: true)
        print("full score is \(randomValue)")
        userTextField.text = ""
        
    }

}

