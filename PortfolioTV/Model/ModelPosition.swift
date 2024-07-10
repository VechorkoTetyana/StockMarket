import Foundation
import UIKit

struct ModelPosition {
    let title: String
    let subtitle: String
    let portfolioValue: String
    
    let price: String
    let lineChart: UIColor
    let procent: String
    
    let graphData: [Double]
    let isGreen: Bool
    
    init(title: String, subtitle: String, portfolioValue: String, price: String, lineChart: UIColor, procent: String, graphData: [Double], isGreen: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.portfolioValue = portfolioValue
        self.price = price
        self.lineChart = lineChart
        self.procent = procent
        self.graphData = graphData
        self.isGreen = isGreen
    }
}

extension ModelPosition {
    func toPortfolioData(portfolioValue: String) -> PortfolioData {
        PortfolioData(
            title: self.title,
            subtitle: self.subtitle,
            portfolioValueNum: self.portfolioValue,
            stockPriceNum: self.price)
    }
}

