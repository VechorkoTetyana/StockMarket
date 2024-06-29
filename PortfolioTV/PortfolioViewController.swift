import Foundation
import UIKit

class PortfolioViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewStockBtn: UIButton!
    
    var modelPosition: [ModelPosition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        modelPosition = list()
        configureButton()
    }
    
    @IBAction func addNewStockBtnTapped(_ sender: Any) {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StockCellFullController") as! StockCellFullController
        
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
        
    }
    
    private func configureTableView() {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "StockCell", bundle: nil), forCellReuseIdentifier: "StockCell")
//        tableView.rowHeight = 156
    }
    
    private func list() -> [ModelPosition] {
        
        var list = [ModelPosition]()
        
        list.append(ModelPosition(
            title: "MSFT",
            subtitle: "Microsoft Corporations",
            portfolioValueNum: "$7,666.23",
            stockPriceNum: "$2,111.03", 
            lineChart: .clear, 
            graphData: [],
            isGreen: true
        ))
        list.append(ModelPosition(
            title: "ACLS",
            subtitle: "Axcelis Technologies, Inc",
            portfolioValueNum: "$6,000.23",
            stockPriceNum: "$647.43", 
            lineChart: .clear, graphData: [], 
            isGreen: true
        ))
        
        return list
    }
    
    private func configureButton() {
        addNewStockBtn.setTitleColor(.white, for: .normal)
        addNewStockBtn.titleLabel?.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
    }
}

extension PortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPosition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as? StockCell
        else { return UITableViewCell() }
        
        let position = modelPosition[indexPath.row]
        
        cell.configure(with: position)
        cell.selectionStyle = .none
        cell.setFirstCellCornerRadius()
        
        return cell
    }
}

extension PortfolioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
}
