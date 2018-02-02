//
//  RecordSoundViewController.swift
//  Projectperfect
//
//  Created by sarathraj on 30/01/18.
//  Copyright © 2018 Acelrtech. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController,AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        stoprecoding.isEnabled=false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var StartRecording: UIButton!
    @IBOutlet weak var StopRecording: UIButton!
    var audioRecorder:AVAudioRecorder!
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        print("sample")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("Button is pressed")
        StopRecording.isEnabled=true
        StartRecording.isEnabled=false
        recordingLabel.text="Recoding in progress"
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.delegate=self
        audioRecorder.record()
    }

    @IBAction func StopRecoding(_ sender: Any) {
       
        StopRecording.isEnabled=false
        StartRecording.isEnabled=true
        //recordingLabel.text="Recoding in progress"
        audioRecorder.stop()
         let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
         recordingLabel.text="stopped"
        
    }
    @IBOutlet weak var stoprecoding: UIButton!
    
    func audioRe
}

