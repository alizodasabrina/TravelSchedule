//
//  ScheduleServiceProtocol.swift
//  TravelSchedule
//

typealias StationSchedule = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> StationSchedule
}
