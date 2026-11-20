//
//  NearestStationsServiceProtocol.swift
//  TravelSchedule
//

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}
