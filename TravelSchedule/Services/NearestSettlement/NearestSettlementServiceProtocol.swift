//
//  NearestSettlementServiceProtocol.swift
//  TravelSchedule
//

typealias NearestCity = Components.Schemas.NearestCityResponse

protocol NearestSettlementServiceProtocol {
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCity
}
