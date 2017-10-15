//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Diwakar Thapa on 10/15/17.
//  Copyright © 2017 Cloudouse. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var recordedurl:URL!
    
    @IBOutlet weak var SlowButton: UIButton!
    
    @IBOutlet weak var FastButton: UIButton!
    
    @IBOutlet weak var highpitchButton: UIButton!
    @IBOutlet weak var lowpitchButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    
    @IBOutlet weak var ReverbButton: UIButton!
    
    @IBOutlet weak var StopButton: UIButton!
   // var a=0;
    var audioFile:AVAudioFile!
    var audioengine:AVAudioEngine!
    var audioPlayerNode:AVAudioPlayerNode!
    var stopTimer:Timer!
    
    
    @IBAction func pressedButton(_ sender: UIButton){
        switch sender.tag {
        case 0:
            playSound(rate:0.5)
        case 1:
            playSound(rate: 0.5)
        case 2:
            playSound(pitch: 1000)
        case 3:
            playSound(pitch: -1000)
        case 4:
            playSound(echo: true)
        case 5:
            playSound(reverb: true)
        default:
            print("error on button pressed!!")
        }
        configureUI(.playing)
        
    }
    @IBAction func stoppressed(_ sender: Any){
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()//setuping the audio in viewdidload..for setuping AV engine
        
        // Do any additional setup after loading the view.
    }

       override func viewWillAppear(_ animated: Bool) {
        //this function is used to configure UL,so that the stop button is disabled when view first appear as app wont be playing any sound until user presses 1 of 6 playback button.
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
