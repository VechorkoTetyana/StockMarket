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
        modelPosition = list()
        stocks = fillDataSource()
    }
    
    private func configureTableView() {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MarketMoversCell", bundle: nil), forCellReuseIdentifier: "MarketMoversCell")
//        tableView.rowHeight = 40
    }
    
    private func list() -> [ModelPosition] {
        
        var list = [ModelPosition]()
        
        list.append(ModelPosition(
            title: "AAPL",
            subtitle: "Apple, Inc",
            coverImageName: .apple,
            portfolioValueNum: "$142.65",
            stockPriceNum: "+ 0.81%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "AMZN",
            subtitle: "Amazon, Inc",
            coverImageName: .amazon,
            portfolioValueNum: "$3,283.26",
            stockPriceNum: "- 0.05%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "FB",
            subtitle: "Facebook, Inc",
            coverImageName: .facebook,
            portfolioValueNum: "$343.01",
            stockPriceNum: "+ 1.07%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "MSFT",
            subtitle: "Microsoft, Corp",
            coverImageName: .microsoftIconSmall,
            portfolioValueNum: "$188.09",
            stockPriceNum: "- 2.29%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "AMD",
            subtitle: "Advance Micr...",
            coverImageName: .amdIcon,
            portfolioValueNum: "$100.41",
            stockPriceNum: "+ 1.99%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "ABSCI",
            subtitle: "ABSCI Corp",
            coverImageName: .abSciIcon,
            portfolioValueNum: "$11.82",
            stockPriceNum: "- 4.83%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "BAC",
            subtitle: "Bank of America",
            coverImageName: .bankOfAmericaIcon,
            portfolioValueNum: "$43.08",
            stockPriceNum: "+ 0.30%",
            lineChart: .clear
        ))
        list.append(ModelPosition(
            title: "ADBE",
            subtitle: "Adobe, Inc",
            coverImageName: .adobe,
            portfolioValueNum: "$576.81",
            stockPriceNum: "+ 0.32%",
            lineChart: .clear
        ))
        
        return list
    }
    
    func configure (with stocks: [ModelPosition]) {
        self.stocks = stocks
        collectionView.reloadData()
    }
    
    private func fillDataSource() -> [ModelPosition] {
        var stockRow = [ModelPosition]()
                    
        stockRow.append(ModelPosition(
                title: "S&P 500",
                subtitle: "Standard & Poor’s",
                coverImageName: .logoMarket,
                portfolioValueNum: "$34,326.46",
                stockPriceNum: "+49,50%",
                lineChart: .clear
            ))
        stockRow.append(ModelPosition(
                title: "Dow",
                subtitle: "Dow Jones",
                coverImageName: .dow,
                portfolioValueNum: "$23,241.46",
                stockPriceNum: "+12,56%",
                lineChart: .clear
            ))
        
        return stockRow
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GreenMarketCollectionCell", bundle: nil), forCellWithReuseIdentifier: "GreenMarketCollectionCell")
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
//        cell.setFirstCellCornerRadius()
        
        return cell
    }
}

extension StockCellFullController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
