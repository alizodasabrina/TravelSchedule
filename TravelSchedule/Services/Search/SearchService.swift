//
//  SearchService.swift
//  TravelSchedule
//

import OpenAPIRuntime
import OpenAPIURLSession

final class SearchService: SearchServiceProtocol {
    private let client: Client
    private let apiKey: String

    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }

    func getSchedualBetweenStations(from: String, to: String) async throws -> RouteSegments {
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apiKey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
}
