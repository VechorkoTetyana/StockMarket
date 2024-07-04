import UIKit

class PortfolioViewModel {
    private var repository = PortfolioRepository()
    
    var modelPositionForBase: [ModelPositionForBase] = []
    
    var didFetchPortfolio: () -> ()
    
    init(repository: PortfolioRepository = PortfolioRepository(), didFetchPortfolio: @escaping (() -> ())) {
        self.repository = repository
        self.didFetchPortfolio = didFetchPortfolio
    }
    
    func fetchPortfolio() {
        Task {
            do {
                let result = try await repository.fetchPortfolio()
                self.modelPositionForBase = result.sorted(by: {
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
