//
//  ViewController.swift
//  EggTimer
//
//  Created by Çiğdem Alan on 31.10.2023.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var textL: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var eggTimer : [String:Int] = ["Soft":3,"Medium":4, "Hard":7]
    var totaltime = 0
    var passedTime = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    var counter = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func hardnessSelectedBut(_ sender: UIButton) {
        
        timer.invalidate()
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: url!)
        self.player.stop()
        
        
        var hardness = sender.currentTitle!
        self.totaltime = eggTimer[hardness]!
        self.counter = eggTimer[hardness]!
        
        textL.text = hardness
        passedTime = 0
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    @objc func timeUp(){
        
        if passedTime < totaltime {
            
            passedTime += 1
            counter -= 1
            
            progressBar.progress = (Float(passedTime)/Float(totaltime))
            
            
            self.timeLabel.text = "Last \(counter) sec."
            //print(progressBar.progress)
            
        } else {
            
            timer.invalidate()
            textL.text = " Done!!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: url!)
            self.player.play()
            
        }
        
    }
    
}

