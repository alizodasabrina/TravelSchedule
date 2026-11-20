//
//  BaseService.swift
//  TravelSchedule
//

import OpenAPIRuntime
import OpenAPIURLSession

class BaseService {
    let client: Client
    let apiKey: String

    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
}
