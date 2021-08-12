//
//  HapticFeedback.swift
//  ADG@PaperVIT_IOS
//
//  Created by Vaibhav Shah on 12/08/21.
//

import Foundation
import AVKit

class hapticFeedback {
    
    static let hapticTouch = hapticFeedback()
    func haptiFeedbackSucess() {
        let hapticState = UserDefaults.standard.object(forKey: key.values.hapticState) as! Bool
        if hapticState == true {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
}
