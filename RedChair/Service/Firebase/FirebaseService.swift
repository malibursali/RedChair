//
//  FirebaseService.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 3.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation
import Firebase
import FirebaseRemoteConfig

class FirebaseService {
    static let sharedInstance = FirebaseService()
    let remoteConfig = RemoteConfig.remoteConfig()
    
    func analyticsLogEvent(_ movieDetail: MovieDetail) {
        Analytics.logEvent("movie", parameters: [
            "title": movieDetail.title,
            "year": movieDetail.year,
            "released": movieDetail.released,
            "runtime": movieDetail.runtime,
            "genre": movieDetail.genre,
            "director": movieDetail.director,
            "actors": movieDetail.actors,
            "language": movieDetail.language,
            "country": movieDetail.country
        ])
    }
    
    func fetchRemoteConfig(completion: @escaping (_ isSucces: Bool) -> Void) {
        let settings = RemoteConfigSettings()
        self.remoteConfig.configSettings = settings
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { (status, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            }
            else {
                if status == .success {
                    self.remoteConfig.activate { (changed, error) in
                        if error != nil {
                            completion(false)
                        }
                        else {
                            completion(true)
                        }
                    }
                }
                else {
                    completion(false)
                }
            }
        }
    }
    
    func fetchValue(withKey key: String) -> RemoteConfigValue {
        let value = self.remoteConfig.configValue(forKey: key)
        
        return value
    }
}
