//
//  ViewController.swift
//  Clicker & Segmented Control
//
//  Created by 陳佩琪 on 2023/4/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayerMuyu: AVAudioPlayer?
    var audioPlayerBell: AVAudioPlayer?
    
    var muyuCount = 0
    var bellCount = 0
    
    
    // 木魚 & 鐘圖片
    @IBOutlet weak var instrumentImageView: UIImageView!
    
    // segmented Control
    @IBOutlet weak var instrumentSegmentedControl: UISegmentedControl!
    
    // 圖片上的隱形按鈕
    @IBOutlet weak var instrumentClick: UIButton!
    
    // 敲擊次數顯示
    @IBOutlet weak var knockTimes: UILabel!
    
    // 結束按鈕
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let muyuUrl = Bundle.main.url(forResource: "muyuSound", withExtension: "mp3")!
        do {
            audioPlayerMuyu = try AVAudioPlayer(contentsOf: muyuUrl)
        } catch {
            print("播放音效檔案出現錯誤：\(error)")
        }
        
        let bellUrl = Bundle.main.url(forResource: "bellSound", withExtension: "mp3")!
        do {
            audioPlayerBell = try AVAudioPlayer(contentsOf: bellUrl)
            audioPlayerBell?.volume = 0.8
        } catch {
            print("播放音效檔案出現錯誤：\(error)")
        }
        
        instrumentImageView.image = UIImage(named: "muyu")
        knockTimes.text = ("敲擊次數：\(muyuCount)")
        audioPlayerMuyu?.play()
        audioPlayerMuyu?.stop()
        audioPlayerMuyu?.currentTime = 0
        audioPlayerMuyu?.play()
        
    
        instrumentSegmentedControl.setTitle("木魚靜心", forSegmentAt: 0)
        instrumentSegmentedControl.setTitle("敲鐘祈福", forSegmentAt: 1)
        
        resetButton.setTitle("完成", for: .normal)
        resetButton.setTitleColor(UIColor.black, for: .normal)
        resetButton.setTitleColor(UIColor.systemGray5, for: .highlighted)
        resetButton.tintColor = UIColor.systemGray5

    }
    

    // segmented control 頁面切換
    @IBAction func instrumentPageChange(_ sender: Any) {
        instrumentSegmentedControl.setTitle("木魚靜心", forSegmentAt: 0)
        instrumentSegmentedControl.setTitle("敲鐘祈福", forSegmentAt: 1)

        
        let instrumentPage = instrumentSegmentedControl.selectedSegmentIndex

        if instrumentPage == 0 {
            instrumentImageView.image = UIImage(named: "muyu")
            knockTimes.text = ("敲擊次數：\(muyuCount)")
        } else if instrumentPage == 1  { instrumentImageView.image = UIImage(named: "bell")
            knockTimes.text = ("敲擊次數：\(bellCount)")
        }
    }
    
    // 點擊圖片按鈕
    @IBAction func knockOnInstrument(_ sender: Any) {
        if instrumentImageView.image == UIImage(named: "muyu") {
            muyuCount += 1
            knockTimes.text = ("敲擊次數：\(muyuCount)")
            audioPlayerMuyu?.play()
            audioPlayerMuyu?.stop()
            audioPlayerMuyu?.currentTime = 0
            audioPlayerMuyu?.play()
        } else if instrumentImageView.image == UIImage(named: "bell") {
            bellCount += 1
            print(bellCount)
            knockTimes.text = ("敲擊次數：\(bellCount)")
            audioPlayerBell?.play()
            audioPlayerBell?.stop()
            audioPlayerBell?.currentTime = 0
            audioPlayerBell?.play()
        }
    }
    
    // 結束按鈕
    @IBAction func reset(_ sender: Any) {
        if instrumentImageView.image == UIImage(named: "muyu") {
            muyuCount = 0
            knockTimes.text = ("敲擊次數：\(muyuCount)")

        } else if instrumentImageView.image == UIImage(named: "bell") {
            bellCount = 0
            print(bellCount)
            knockTimes.text = ("敲擊次數：\(bellCount)")
        }
    }
}

