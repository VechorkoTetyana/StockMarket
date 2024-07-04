import Foundation
import UIKit

struct ModelPosition {
    let title: String
    let subtitle: String
    
    let portfolioValueNum: String
    let stockPriceNum: String
    let lineChart: UIColor
    
    let graphData: [Double]
    let isGreen: Bool
    
    init(
        title: String,
        subtitle: String,
        portfolioValueNum: String,
        stockPriceNum: String,
        lineChart: UIColor,
        graphData: [Double],
        isGreen: Bool
    ) {
        self.title = title
        self.subtitle = subtitle
        self.portfolioValueNum = portfolioValueNum
        self.stockPriceNum = stockPriceNum
        self.lineChart = lineChart
        self.graphData = graphData
        self.isGreen = isGreen
    }
}

struct ModelPositionForBase {
    let title: String
    let subtitle: String
    
    let portfolioValueNum: String
    let stockPriceNum: String
    
    let coverImageView: String

    init(
        title: String,
        subtitle: String,
        portfolioValueNum: String,
        stockPriceNum: String,
        coverImageView: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.portfolioValueNum = portfolioValueNum
        self.stockPriceNum = stockPriceNum
        self.coverImageView = coverImageView
    }
}

