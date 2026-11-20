//
//  CopyrightServiceProtocol.swift
//  TravelSchedule
//

typealias CopyrightInfo = Components.Schemas.CopyrightResponse

protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> CopyrightInfo
}
