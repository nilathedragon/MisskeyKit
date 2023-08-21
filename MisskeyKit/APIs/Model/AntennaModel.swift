//
//  AntennaModel.swift
//  
//
//  Created by Nila on 21.08.2023.
//

import Foundation

public struct AntennaModel: Codable {
    public let id, name, createdAt, src: String?
    public let caseSensitive, notify, withReplies, withFile, hasUnreadNotes: Bool?
    public let keywords, excludeKeywords: [[String]]?
    public let users, instances: [String]?
}
