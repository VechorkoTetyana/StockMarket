import Foundation
import UIKit

struct MarketData: Codable {
    let tickers: [StockDataDTO]
}

struct StockDataDTO: Codable {
    let symbol: String
    let price: Double
    let name: String
    let type: String
    let change: [StockChangeDTO]
}

struct StockChangeDTO: Codable {
    let date: TimeInterval
    let close: Double
}

struct StockChange {
    let date: Date
    let close: Double
}

extension StockDataDTO {
    func toDomain() -> ModelPosition {
       
        let graphData = getGraphData()
        let procentData = procentValue(data: graphData)
        
        return ModelPosition(title: self.symbol,
                    subtitle: self.name,
                    portfolioValue: String(format: "$%.2f", self.price),
                    price: String(format: "$%.2f", self.price),
                    lineChart: UIColor.green,
                    procent: String(format: "%.2f%%", procentData),
                    graphData: graphData,
                    isGreen: detectIfGreen(data: graphData)
        )
    }
    
    func getGraphData() -> [Double] {
        let stockChanges = self.change.map({ dto in
            return StockChange(date: Date(timeIntervalSince1970: dto.date), close: dto.close)
        })
        let sorted = stockChanges.sorted { first, second in
            return first.date > second.date
        }
        print("getGraphData \(sorted.map { $0.date.description } )")
        
        return sorted.map { $0.close }
    }
    
    func detectIfGreen(data: [Double]) -> Bool {
        var isGreen = true
        
        if let last = data.last, data.count > 1 {
            isGreen = data[data.count - 2] < last
        }
        
        return isGreen
    }
    
    func procentValue(data: [Double]) -> Double {
        guard let last = data.last, data.count > 1 else {
                    return 0
                }
        
        let first = data[data.count - 2]
        let procent = ((last - first) / first) * 100
                
        return procent
    }
}

