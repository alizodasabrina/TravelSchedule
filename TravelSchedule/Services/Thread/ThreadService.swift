//
//  ThreadService.swift
//  TravelSchedule
//

final class ThreadService: BaseService, ThreadServiceProtocol {
    func getRouteStations(uid: String) async throws -> RouteStations {
        let response = try await client.getRouteStations(query: .init(
            apikey: apiKey,
            uid: uid
        ))
        return try response.ok.body.json
    }
}
