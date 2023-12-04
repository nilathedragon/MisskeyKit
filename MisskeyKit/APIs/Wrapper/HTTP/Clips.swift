//
//  Clips.swift
//  MisskeyKit
//
//  Created by Nila on 04.12.2023.
//  Copyright © 2023 Yuiga Wada. All rights reserved.
//

import Foundation

extension MisskeyKit {
    public class Clips: Api {
        private let handler: ApiHandler
        required init(from handler: ApiHandler) {
            self.handler = handler
        }
        
        public func list(result callback: @escaping ClipsCallback) {
            var params = [:] as [String: Any?]
            
            params = params.removeRedundant() as [String: Any]
            handler.handleAPI(needApiKey: true, api: "clips/list", params: params as [String: Any], type: [ClipModel].self) { clips, error in
                
                if let error = error { callback(nil, error); return }
                guard let clips = clips else { callback(nil, error); return }
                
                callback(clips, nil)
            }
        }
        
        public func addNote(clipId: String, noteId: String, result callback: @escaping BooleanCallBack) {
            var params = [
                "clipId": clipId,
                "noteId": noteId
            ] as [String: Any?]
            
            params = params.removeRedundant() as [String: Any]
            handler.handleAPI(needApiKey: true, api: "clips/add-note", params: params as [String: Any], type: Bool.self) { _, error in
                callback(error == nil, error)
            }
        }
        
        public func removeNote(clipId: String, noteId: String, result callback: @escaping BooleanCallBack) {
            var params = [
                "clipId": clipId,
                "noteId": noteId
            ] as [String: Any?]
            
            params = params.removeRedundant() as [String: Any]
            handler.handleAPI(needApiKey: true, api: "clips/remove-note", params: params as [String: Any], type: Bool.self) { _, error in
                callback(error == nil, error)
            }
        }
    }
}
