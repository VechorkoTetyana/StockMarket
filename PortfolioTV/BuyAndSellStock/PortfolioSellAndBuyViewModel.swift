import Foundation

class PortfolioSellAndBuyViewModel {
    
    private let repository = MainPortfolioRepository()
    
    let portfolioData: PortfolioData
    let dismiss: () -> ()
    
   
    init(portfolioData: PortfolioData, dismiss: @escaping () -> Void) {
        self.portfolioData = portfolioData
        self.dismiss = dismiss
    }
    
    func buyStock(with amount: String) {
        Task {
            do {
                var updatedData = portfolioData
                updatedData.portfolioValueNum = amount
                try await repository.setStock(portfolioData)
                await MainActor.run {
                    self.dismiss()
                }
            } catch {
                print(error)
            }
        }
    }
    
    func sellStock(with amount: Double) {
        Task {
            do {
                
                await MainActor.run {
                    self.dismiss()
                }
            } catch {
                print(error)
            }
        }
    }
}

