import Foundation
import UIKit

/* https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json

 curl -X POST -d '{"title": "", "": "", "": ""}' 'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'

 curl -X PATCH -d '{"title": "", "": "", "": ""}' 'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'

 curl -X DELETE  'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'

 curl -X POST -d '{"": "", "": ""}' 'https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json'
  */

struct FirebasePostResponseDTO: Codable {
    let name: String
}

struct PortfolioDTO: Codable {
    let portfolioValueNum: String
    let stockPriceNum: String
    let subtitle: String
    let title: String
    
    init(portfolioValueNum: String, stockPriceNum: String, subtitle: String, title: String) {
        self.portfolioValueNum = portfolioValueNum
        self.stockPriceNum = stockPriceNum
        self.subtitle = subtitle
        self.title = title
    }
}

protocol PortfolioRepository{
    func fetchPortfolio() async throws -> [PortfolioData]
    func buyStock(_ price: PortfolioData) async throws
}

class MainPortfolioRepository {
    
    typealias PortfolioResponse = [String: PortfolioDTO]
    
    private let baseUrl = URL(string: "https://portfolio-eaef9-default-rtdb.europe-west1.firebasedatabase.app/")!
    
    private lazy var stockUrl = baseUrl.appending(path: "modelPosition.json")
    
    private lazy var decoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()
    
    private lazy var encoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        return encoder
    }()
    
    func fetchPortfolio() async throws -> [PortfolioData] {
        var request = URLRequest(url: stockUrl)
        request.httpMethod = "GET"
                
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoded = try JSONDecoder().decode(PortfolioResponse.self, from: data)
        
        return toDomain(decoded)
    }
    
    func setStock(_ price: PortfolioData) async throws {
        var request = URLRequest(url: baseUrl.appending(path: "modelPosition/\(price.title).json"))
        
        request.httpMethod = "PUT"
        request.httpBody = try encoder.encode(price)
        
       // let (data, responce) = try await URLSession.shared.data(for: request)
        
     //   let decoded = try decoder.decode(FirebasePostResponseDTO.self, from: data)
        
        print("Successfully added \(price.title) to database with id")
    }
    
    func deleteStock(_ stock: PortfolioData) async throws {
        var request = URLRequest(url: baseUrl.appending(path: "modelPosition/\(stock.title).json"))
        request.httpMethod = "DELETE"
        
        let _ = try await URLSession.shared.data(for: request)
        
        print("Successfully deleted stock with id \(stock.title)")
    }
    
    private func toDomain(_ response: PortfolioResponse) -> [PortfolioData] {
        var result = [PortfolioData]()
        
        for (_, portfolioDTO) in response {
            result.append(portfolioDTO.toDomain)
        }
        return result
    }

}

extension PortfolioDTO {
    var toDomain: PortfolioData {
        PortfolioData(
            title: title,
            subtitle: subtitle,
            portfolioValueNum: portfolioValueNum,
            stockPriceNum: stockPriceNum
        )
    }
}
