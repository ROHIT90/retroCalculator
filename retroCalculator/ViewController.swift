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
    
    enum Operations: String
    {
        case Divide = "/"
        case Multiply = "*"
        case Addition = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    var buttonSound : AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightVarStr = ""
    var currentOperation: Operations = Operations.Empty
    var  results = ""
    
    
    
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
        runningNumber +=  "\(btn.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed (sender: AnyObject)
    {
        processOperation(Operations.Divide)
    }
    
    @IBAction func onMultiplyPressed (sender:AnyObject)
    {
        processOperation(Operations.Multiply)
    }
    
    @IBAction func onSubtractPressed (sender : AnyObject)
    {
        processOperation(Operations.Subtract)
    }
    
    @IBAction func onAddPressed (sender : AnyObject)
    {
        processOperation(Operations.Addition)
    }
    
    @IBAction func onEqualsPressed (sender:AnyObject)
    {
        processOperation(currentOperation)
    }
    
    func processOperation(op:Operations)
    {
        playSound()
        if (currentOperation != Operations.Empty){
            rightVarStr = runningNumber
            runningNumber = ""
            
            if (currentOperation == Operations.Multiply){
                results = "\(Double(leftValStr)! * Double(rightVarStr)!)"
            } else if (currentOperation == Operations.Divide){
                results = "\(Double(leftValStr)! / Double(rightVarStr)!)"
            } else if (currentOperation == Operations.Addition){
                results = "\(Double(leftValStr)! + Double(rightVarStr)!)"
            } else if (currentOperation == Operations.Subtract){
                results = "\(Double(leftValStr)! - Double(rightVarStr)!)"
            }
            
            leftValStr = results
            outputLabel.text = results
            currentOperation = op
        }
        else{
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound()  {
        if buttonSound.playing {
            buttonSound.stop()
        }
        buttonSound.play()
    }

}

