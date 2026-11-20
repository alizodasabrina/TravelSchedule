//
//  SearchService.swift
//  TravelSchedule
//

final class SearchService: BaseService, SearchServiceProtocol {
    func getSchedualBetweenStations(from: String, to: String) async throws -> RouteSegments {
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apiKey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
}
