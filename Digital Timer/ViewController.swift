//
//  ViewController.swift
//  Digital Timer
//
//  Created by 김종현 on 2018. 4. 4..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeSwitch: UISwitch!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeSwitch.setOn(false, animated: true)
        //처음 스위치 상태를 거짓으로 설정
    }
    
    func updateTime() {
        let date = Date()//현재 시스템 시간,날짜등
        let formatter = DateFormatter() //출력할 형태 지정
        formatter.dateFormat = "a HH:mm:ss EEE" // 시간:분:초 날짜(EEE : 영어 앞에 3글자, EEEE : 영어 전체, EEEEE : 영어 첫자, a : am,pm 출력)
        timeLabel.text = formatter.string(from: date)
        //label에 Date 출력
    }
    
    @IBAction func timeswitch(_ sender: Any) {
        if timeSwitch.isOn == true //스위치가 참이면 타이머 실행
        {
//            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
                self.updateTime()// Closure를 이용해서 함수를 인자로 넘긴다.
            })
            
            
        }
        else//거짓이면 타이머 종료
        {myTimer.invalidate()
            timeLabel.text = "00:00:00"
        }
        
    }
}

