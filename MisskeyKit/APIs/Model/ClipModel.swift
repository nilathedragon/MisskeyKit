//
//  ClipModel.swift
//  MisskeyKit
//
//  Created by Nila on 04.12.2023.
//  Copyright © 2023 Yuiga Wada. All rights reserved.
//

import Foundation

public class ClipModel: Codable {
    public var id: String?
    public var createdAt: String?
    public var userId: String?
    public var user: UserModel?
    public var name: String?
    public var description: String?
    public var isPublic: Bool?
}
