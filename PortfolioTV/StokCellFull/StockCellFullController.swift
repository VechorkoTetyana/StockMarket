import Foundation
import UIKit

class StockCellFullController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var stocks: [ModelPosition] = []
    var modelPosition: [ModelPosition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureTableView()
        
        loadStockGraphs()

        collectionView.reloadData()
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MarketMoversCell", bundle: nil), forCellReuseIdentifier: "MarketMoversCell")
    }
    
    private func loadStockGraphs() {
        guard
            let path = Bundle.main.path(forResource: "market", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let marketData = try? JSONDecoder().decode(MarketData.self, from: data)
                
        else { return }
        
        stocks.removeAll()
        modelPosition.removeAll()
        
        let dtoObjekts = marketData.tickers
                
        for dto in dtoObjekts {
            if dto.type == "index" {
                stocks.append(dto.toDomain())
            } else if dto.type == "stock" {
                modelPosition.append(dto.toDomain())
            }
        }
    }

    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GreenMarketCollectionCell", bundle: nil), forCellWithReuseIdentifier: "GreenMarketCollectionCell")
    }
    
    func present(with modelPosition: ModelPosition) {
        let buyStockController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "BuyStockController") as! BuyStockController
        
        buyStockController.details = [modelPosition]
        
        buyStockController.modalPresentationStyle = .fullScreen
        
        present(buyStockController, animated: true)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func lupaBtnTapped(_ sender: Any) {
    }
}

extension StockCellFullController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GreenMarketCollectionCell", for: indexPath) as? GreenMarketCollectionCell else { return UICollectionViewCell() }
        
        let stock = stocks[indexPath.row]
        
        cell.configure(stock)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stocks.count
    }
}

extension StockCellFullController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 239, height: 136)
    }
}

extension StockCellFullController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPosition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MarketMoversCell") as? MarketMoversCell
        else { return UITableViewCell() }
        
        let position = modelPosition[indexPath.row]
                
        cell.configure(with: position)
        cell.selectionStyle = .none
        
        return cell
    }
}

extension StockCellFullController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = modelPosition[indexPath.row]
        present(with: position)
    }
}

