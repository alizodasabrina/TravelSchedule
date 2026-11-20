//
//  StationsListService.swift
//  TravelSchedule
//

import Foundation

final class StationsListService: BaseService, StationsListServiceProtocol {
    /// Несмотря на то что в документации формат ответа указан как application/json,
    /// на деле сервер отвечает text/html с тем же JSON внутри — поэтому тело читается
    /// как html-поток байтов и декодируется вручную.
    func getAllStations() async throws -> AllStations {
        let response = try await client.getAllStations(query: .init(apikey: apiKey))
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8

        let limit = 50 * 1024 * 1024 // 50Mb
        let fullData = try await Data(collecting: responseBody, upTo: limit)

        return try JSONDecoder().decode(AllStations.self, from: fullData)
    }
}
