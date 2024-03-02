//
//  Webservice.swift
//  Test
//
//  Created by yukifuruhashi on 2024/03/02.
//

import Foundation

enum NetWorkError: Error {
    case invalidUrl
    case badRequest
}


class Webservice {
    
    func fetchRandomFact() async throws -> QiitaStruct? {
        
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            throw NetWorkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetWorkError.badRequest
        }
        
        return try JSONDecoder().decode([QiitaStruct].self, from: data).randomElement()
    }
}
