//
//  CarrierServiceProtocol.swift
//  TravelSchedule
//

typealias CarrierInfo = Components.Schemas.CarrierResponse

protocol CarrierServiceProtocol {
    func getCarrierInfo(code: String, system: String?) async throws -> CarrierInfo
}
