//
//  StationsListServiceProtocol.swift
//  TravelSchedule
//

typealias AllStations = Components.Schemas.AllStationsResponse

protocol StationsListServiceProtocol {
    func getAllStations() async throws -> AllStations
}
