//
//  +Notes.swift
//  MisskeyKit
//
//  Created by Yuiga Wada on 2019/11/04.
//  Copyright © 2019 Yuiga Wada. All rights reserved.
//

import Foundation

public class NoteModel: Codable {
    public var id, createdAt, userId: String?
    public var user: UserModel?
    public var text, cw: String?
    public var visibility: Visibility?
    public var viaMobile: Bool?
    public var isHidden: Bool?
    public var renoteCount, repliesCount: Int?
    public var reactions: [String:Int]?
    public var emojis, reactionEmojis: [EmojiModel]?
    public var files: [File?]?
    public var replyId, renoteId: String?
    public var renote: NoteModel?
    public var mentions: [String?]?
    public var visibleUserIds: [String?]?
    public var reply: NoteModel?
    public var tags: [String]?
    public var myReaction: String?
    public var fileIds: [String?]?
    public var app: App?
    public var poll: Poll?
    public var geo: Geo?
    public var _featuredId_: String?
    public var _prId_: String?
    
    public init(id: String? = nil, createdAt: String? = nil, userId: String? = nil, user: UserModel? = nil, text: String? = nil, cw: String? = nil, visibility: Visibility? = nil, viaMobile: Bool? = nil, isHidden: Bool? = nil, renoteCount: Int? = nil, repliesCount: Int? = nil, reactions: [String : Int]? = nil, emojis: [EmojiModel]? = nil, reactionEmojis: [EmojiModel]? = nil, files: [File?]? = nil, replyId: String? = nil, renoteId: String? = nil, renote: NoteModel? = nil, mentions: [String?]? = nil, visibleUserIds: [String?]? = nil, reply: NoteModel? = nil, tags: [String]? = nil, myReaction: String? = nil, fileIds: [String?]? = nil, app: App? = nil, poll: Poll? = nil, geo: Geo? = nil, _featuredId_: String? = nil, _prId_: String? = nil) {
        self.id = id
        self.createdAt = createdAt
        self.userId = userId
        self.user = user
        self.text = text
        self.cw = cw
        self.visibility = visibility
        self.viaMobile = viaMobile
        self.isHidden = isHidden
        self.renoteCount = renoteCount
        self.repliesCount = repliesCount
        self.reactions = reactions
        self.emojis = emojis
        self.reactionEmojis = reactionEmojis
        self.files = files
        self.replyId = replyId
        self.renoteId = renoteId
        self.renote = renote
        self.mentions = mentions
        self.visibleUserIds = visibleUserIds
        self.reply = reply
        self.tags = tags
        self.myReaction = myReaction
        self.fileIds = fileIds
        self.app = app
        self.poll = poll
        self.geo = geo
        self._featuredId_ = _featuredId_
        self._prId_ = _prId_
    }
}

public class App: Codable {
    public var id, name, callbackUrl: String?
    public var permission: [String]?
}

// MARK: - File

public struct File: Codable {
    public var id, createdAt, name, type, comment: String?
    public var md5: String?
    public var size: Int?
    public var isSensitive: Bool?
    public var properties: Properties?
    public var url, thumbnailUrl: String?
    public var folderId, folder, user: String?
}

// MARK: - Properties

public struct Properties: Codable {
    public var width, height: Int?
    public var avgColor: String?
}

// MARK: - Visibility

public enum Visibility: String, Codable {
    case `public`
    case home
    case followers
    case specified
}

// MARK: - Geo

public struct Geo: Codable {
    public var coordinates: [String?]?
    public var altitude, accuracy, altitudeAccuracy, heading: Int?
    public var speed: Int?
    
    public init() {
        coordinates = []
        altitude = 0
        accuracy = 0
        altitudeAccuracy = 0
        heading = 0
        speed = 0
    }
}

public struct ReactionModel: Codable {
    public var id, createdAt, type: String?
    public var user: UserModel?
}

// MARK: - Poll

public struct Poll: Codable {
    public var choices: [Choice?]?
    public var multiple: Bool?
    public var expiresAt, expiredAfter: String?
    
    public init() {
        multiple = nil
        choices = nil
        expiredAfter = nil
        expiresAt = nil
    }
}

public struct Choice: Codable {
    public var text: String?
    public var votes: Int?
    public var isVoted: Bool?
}

public struct NoteState: Codable {
    public var isFavorited, isWatching: Bool?
}

extension Geo {
    func toDictionary() -> [String: Any] {
        return [
            "coordinates": coordinates as Any,
            "altitude": altitude as Any,
            "accuracy": accuracy as Any,
            "altitudeAccuracy": altitudeAccuracy as Any,
            "heading": heading as Any,
            "speed": heading as Any
        ]
    }
}

extension Poll {
    func toDictionary() -> [String: Any] {
        return [
            "multiple": multiple as Any,
            "choices": choices as Any,
            "expiresAt": expiresAt as Any,
            "expiredAfter": expiredAfter as Any
        ]
    }
}
