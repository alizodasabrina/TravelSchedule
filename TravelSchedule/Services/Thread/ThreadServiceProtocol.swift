//
//  ThreadServiceProtocol.swift
//  TravelSchedule
//

typealias RouteStations = Components.Schemas.ThreadStationsResponse

protocol ThreadServiceProtocol {
    func getRouteStations(uid: String) async throws -> RouteStations
}
