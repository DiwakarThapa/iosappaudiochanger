//
//  REcordSoundViewController.swift
//  PitchPerfect
//
//  Created by Diwakar Thapa on 9/26/17.
//  Copyright © 2017 Cloudouse. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate{

    @IBOutlet weak var recordlebel: UILabel!
    var audiorecorder:AVAudioRecorder!
    
    
    
    
    @IBOutlet weak var stoprecording: UIButton!
    @IBOutlet weak var recordingbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stoprecording.isEnabled=false
    }
    override func viewWillAppear(_ animated: Bool) {
       }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordStop(_ sender: Any) {
    recordingbutton.isEnabled=true
        recordlebel.text="Tab to record"
        stoprecording.isEnabled=false
       self.audiorecorder.stop()
        let audiosession=AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
    }

    @IBAction func recordaudio(_ sender: AnyObject) {
        print("recording")
        recordlebel.text="recording in progress";
        stoprecording.isEnabled=true
        recordingbutton.isEnabled=false
        let dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName="recordedVoice.wav"
        let pathArray=[dirpath,recordingName]
        let filePath = URL(string: pathArray.joined(separator:"/"))
        let session=AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryRecord,with: .defaultToSpeaker)
        try! audiorecorder=AVAudioRecorder(url: filePath!,settings:[:])
        audiorecorder.delegate = self
        audiorecorder.isMeteringEnabled=true
        audiorecorder.prepareToRecord()
        audiorecorder.record()
        
        
        
    }
    //this function is called imediately when audiorecorder.stop() is called.
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
       print("stoped recording")
        if flag{
        performSegue(withIdentifier: "stopRecording", sender:audiorecorder.url)
        }else{
            print("not recorded!!!")
        }}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier=="stopRecording"{
       let playsoundvc=segue.destination as! PlaySoundViewController
            
           let recordedAudioURL=sender as! URL
            playsoundvc.recordedurl=recordedAudioURL
            
            
            
        }
            
    }
   }

