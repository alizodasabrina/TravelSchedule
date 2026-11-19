//
//  SearchService.swift
//  TravelSchedule
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias RouteSegments = Components.Schemas.Segments

protocol SearchServiceProtocol {
    func getSchedualBetweenStations(from: String, to: String) async throws -> RouteSegments
}

final class SearchService: SearchServiceProtocol {
    private let client: Client
    private let apikey: String

    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }

    func getSchedualBetweenStations(from: String, to: String) async throws -> RouteSegments {
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
}
