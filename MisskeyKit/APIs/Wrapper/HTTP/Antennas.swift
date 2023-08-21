//
//  Antenna.swift
//  
//
//  Created by Nila on 21.08.2023.
//

import Foundation

extension MisskeyKit {
    public class Antennas: Api {
        private let handler: ApiHandler
        required init(from handler: ApiHandler) {
            self.handler = handler
        }
        
        public func list(result callback: @escaping AntennasCallback) {
            
            handler.handleAPI(needApiKey: true, api: "antennas/list", params: [:] as [String: Any], type: [AntennaModel].self) { antennas, error in
                
                if let error = error { callback(nil, error); return }
                guard let antennas = antennas else { callback(nil, error); return }
                
                callback(antennas, nil)
            }
        }
    }
}
