//
//  Weather.swift
//  weatherproj
//
//  Created by Angelo Ou on 6/18/20.
//  Copyright © 2020 Angelo Ou. All rights reserved.
//

import Foundation

public class WeatherInfo: Decodable {
    var main: MainInfo
}

public class MainInfo: Decodable {
    public var temp: Double
    public var temp_min: Double
    public var temp_max: Double
    public var pressure: Double
    public var humidity: Double
}
