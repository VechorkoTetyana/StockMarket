import Foundation

class PortfolioXViewModel {
    
    private let repository = MainPortfolioRepository()
        
        var portfolioData: [PortfolioData] = []
        
        var didFetchPortfolio: (() -> ())!
        
        func fetchPortfolio() {
            Task {
                do {
                    let result = try await repository.fetchPortfolio()
                    self.portfolioData = result.sorted(by: {
                        $0.title < $1.title
                    })
                    await MainActor.run {
                        self.didFetchPortfolio()
                    }
                    self.didFetchPortfolio()
                } catch {
                    print(error)
                }
            }
        }
}
