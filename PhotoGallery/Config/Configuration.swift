//
//  Configuration.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 27/4/22.
//

import Foundation

enum EnvConfig: String {
    //Error types
    enum ConfigError: Error {
        case missingKey
    }
    
    case UNSPLASH_HOST
    case UNSPLASH_CLIENT_ID
    
    static func value(_ key: EnvConfig) throws -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String
        else {
            throw ConfigError.missingKey
        }
        return value
    }
}
