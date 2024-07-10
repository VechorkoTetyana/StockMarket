import Foundation
import UIKit

struct PortfolioData: Codable {
    let title: String
    let subtitle: String
    
    var portfolioValueNum: String
    let stockPriceNum: String
    
    init(
        title: String,
        subtitle: String,
        portfolioValueNum: String,
        stockPriceNum: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.portfolioValueNum = portfolioValueNum
        self.stockPriceNum = stockPriceNum
    }
}

