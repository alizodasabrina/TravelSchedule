//
//  CopyrightService.swift
//  TravelSchedule
//

final class CopyrightService: BaseService, CopyrightServiceProtocol {
    func getCopyright() async throws -> CopyrightInfo {
        let response = try await client.getCopyright(query: .init(apikey: apiKey))
        return try response.ok.body.json
    }
}
