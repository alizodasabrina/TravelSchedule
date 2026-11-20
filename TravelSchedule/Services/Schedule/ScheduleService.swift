//
//  ScheduleService.swift
//  TravelSchedule
//

import OpenAPIRuntime
import OpenAPIURLSession

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client
    private let apiKey: String

    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }

    func getStationSchedule(station: String) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apiKey,
            station: station
        ))
        return try response.ok.body.json
    }
}
