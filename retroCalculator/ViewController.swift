//
//  ViewController.swift
//  retroCalculator
//
//  Created by rohit FNU on 4/3/16.
//  Copyright © 2016 rohit FNU. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel:UILabel!
    
    var buttonSound : AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightVarStr = ""
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundUrl)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    

    @IBAction func numberPressed (btn: UIButton!)
    {
        buttonSound.play()
    }
    
    @IBAction func onDividePressed (sender: AnyObject)
    {
    
    }
    
    @IBAction func onMultiplyPressed (sender:AnyObject)
    {
    }
    
    @IBAction func onSubtractPressed (sender : AnyObject)
    {
    }
    
    @IBAction func onAddPressed (sender : AnyObject)
    {
    }
    
    @IBAction func onEqualsPressed (sender:AnyObject)
    {
    }

}

