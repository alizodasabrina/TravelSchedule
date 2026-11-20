//
//  SearchServiceProtocol.swift
//  TravelSchedule
//

typealias RouteSegments = Components.Schemas.Segments

protocol SearchServiceProtocol {
    func getSchedualBetweenStations(from: String, to: String) async throws -> RouteSegments
}
