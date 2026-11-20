//
//  CarrierService.swift
//  TravelSchedule
//

final class CarrierService: BaseService, CarrierServiceProtocol {
    func getCarrierInfo(code: String, system: String? = nil) async throws -> CarrierInfo {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apiKey,
            code: code,
            system: system
        ))
        return try response.ok.body.json
    }
}
