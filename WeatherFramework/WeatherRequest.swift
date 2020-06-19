//
//  WeatherRequest.swift
//  weatherproj
//
//  Created by Angelo Ou on 6/18/20.
//  Copyright © 2020 Angelo Ou. All rights reserved.
//

import Foundation

public enum WeatherError: Error {
    case noData
    case processingError
}

public class WeatherRequest {
    let resourceURL: URL
    let API_KEY = "a9d1534550c0eb517360254062b78951"
    
    public init(city: String) {
        let resourceString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=imperial"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    public func getWeather(completion: @escaping(Result<MainInfo, WeatherError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weatherInfo = try decoder.decode(WeatherInfo.self, from: jsonData)
                let mainInfo = weatherInfo.main
                completion(.success(mainInfo))
            } catch {
                completion(.failure(.processingError))
            }
        }
        dataTask.resume()
    }
}
