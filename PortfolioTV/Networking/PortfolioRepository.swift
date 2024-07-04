import Foundation
import UIKit

/* https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json

 curl -X POST -d '{"title": "", "": "", "": ""}' 'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'

 curl -X PATCH -d '{"title": "", "": "", "": ""}' 'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'

 curl -X DELETE  'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'

 curl -X POST -d '{"": "", "": ""}' 'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'
  */

struct PortfolioDTO: Codable {
    let portfolioValueNum: String
    let stockPriceNum: String
    let subtitle: String
    let title: String
    let coverImageView: String
    
    init(
        portfolioValueNum: String,
        stockPriceNum: String,
        subtitle: String,
        title: String,
        coverImageView: String
    ) {
        self.portfolioValueNum = portfolioValueNum
        self.stockPriceNum = stockPriceNum
        self.subtitle = subtitle
        self.title = title
        self.coverImageView = coverImageView
    }
}

class PortfolioRepository {
    
    private let url = URL(string: "https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/modelPosition.json")!
    
    typealias PortfolioResponse = [String: PortfolioDTO]
    
    func fetchPortfolio() async throws -> [ModelPositionForBase] {
        let request = URLRequest(url: url)
//        request.httpMethod = "GET"
                
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoded = try JSONDecoder().decode(PortfolioResponse.self, from: data)
        
        return toDomain(decoded)
    }
    
    private func toDomain(_ response: PortfolioResponse) -> [ModelPositionForBase] {
        var result = [ModelPositionForBase]()
        
        for (_, portfolioDTO) in response {
            result.append(portfolioDTO.toDomain)
        }
        return result
    }
}

extension PortfolioDTO {
    var toDomain: ModelPositionForBase {
        ModelPositionForBase(
            title: title,
            subtitle: subtitle,
            portfolioValueNum: portfolioValueNum,
            stockPriceNum: stockPriceNum, 
            coverImageView: coverImageView
        )
    }
}
