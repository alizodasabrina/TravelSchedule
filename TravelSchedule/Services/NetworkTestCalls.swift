//
//  NetworkTestCalls.swift
//  TravelSchedule
//
//  Тестовые вызовы всех сетевых сервисов — для проверки, что каждый из них
//  работает с минимальным набором параметров.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

enum NetworkTestCalls {

    static func runAll() async {
        guard
            let apikey = Bundle.main.object(forInfoDictionaryKey: "RASP_API_KEY") as? String,
            !apikey.isEmpty
        else {
            print("RASP_API_KEY is missing")
            return
        }

        guard let serverURL = try? Servers.Server1.url() else {
            print("Failed to resolve server URL")
            return
        }

        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )

        await run("NearestStations") {
            let service = NearestStationsService(client: client, apikey: apikey)
            let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            return "\(stations.stations?.count ?? 0) stations"
        }

        await run("Search") {
            let service = SearchService(client: client, apikey: apikey)
            let segments = try await service.getSchedualBetweenStations(from: "c146", to: "c213")
            return "\(segments.segments?.count ?? 0) segments"
        }

        await run("Schedule") {
            let service = ScheduleService(client: client, apikey: apikey)
            let schedule = try await service.getStationSchedule(station: "s9600213")
            return "\(schedule.schedule?.count ?? 0) entries"
        }

        await run("Thread") {
            let service = ThreadService(client: client, apikey: apikey)
            // uid из документации ("038AA_tis") устарел — нитки расписания пересоздаются
            // каждый сезон. Используем актуальный uid, полученный живым запросом к /search/.
            let thread = try await service.getRouteStations(uid: "098S_2_2")
            return thread.title ?? "no title"
        }

        await run("NearestSettlement") {
            let service = NearestSettlementService(client: client, apikey: apikey)
            let city = try await service.getNearestCity(lat: 59.864177, lng: 30.319163)
            return city.title ?? "no title"
        }

        await run("Carrier") {
            let service = CarrierService(client: client, apikey: apikey)
            let carrier = try await service.getCarrierInfo(code: "TK", system: "iata")
            return carrier.carrier?.title ?? "no title"
        }

        await run("Copyright") {
            let service = CopyrightService(client: client, apikey: apikey)
            let copyright = try await service.getCopyright()
            return copyright.copyright?.text ?? "no text"
        }

        await run("StationsList") {
            let service = StationsListService(client: client, apikey: apikey)
            let allStations = try await service.getAllStations()
            return "\(allStations.countries?.count ?? 0) countries"
        }
    }

    private static func run(_ label: String, _ call: () async throws -> String) async {
        do {
            let result = try await call()
            print("\(label): \(result)")
        } catch {
            print("\(label) error: \(error)")
        }
    }
}
