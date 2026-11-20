//
//  ScheduleService.swift
//  TravelSchedule
//

final class ScheduleService: BaseService, ScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apiKey,
            station: station
        ))
        return try response.ok.body.json
    }
}
