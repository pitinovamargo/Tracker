//
//  Analytics.swift
//  Tracker
//
//  Created by Margarita Pitinova on 22.08.2023.
//

import Foundation
import YandexMobileMetrica

final class Analytics {
    static let shared = Analytics()
    
    func report(_ event: String, params : [AnyHashable : Any]) {
        YMMYandexMetrica.reportEvent(event, parameters: params, onFailure: { error in
            print("REPORT ERROR: %@", error.localizedDescription)
        })
    }
}
