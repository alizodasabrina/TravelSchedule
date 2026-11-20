//
//  NearestSettlementService.swift
//  TravelSchedule
//

final class NearestSettlementService: BaseService, NearestSettlementServiceProtocol {
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCity {
        let response = try await client.getNearestCity(query: .init(
            apikey: apiKey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
}
