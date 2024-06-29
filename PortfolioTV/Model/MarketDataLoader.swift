import Foundation
import UIKit

class MarketDataLoader {
    
func load() -> [StockDataDTO]? {
    guard
        let path = Bundle.main.path(forResource: "market", ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
        let marketData = try? JSONDecoder().decode(MarketData.self, from: data)
            
    else { return nil }
    
    return marketData.tickers
    }         
}
