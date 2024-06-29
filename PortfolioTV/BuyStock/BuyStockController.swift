import Foundation
import UIKit

class BuyStockController: UIViewController {
    
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var stockAmountLbl: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    
    var details: [ModelPosition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        details = list()
        configureButton()
    }
    
    func configure() {
        titleLbl.text = "1"
        subtitleLbl.text = "2"
        priceLbl.text = "3"
        stockAmountLbl.text = "4"

    }
    
    private func list() -> [ModelPosition] {
        
        var list = [ModelPosition]()
        
        list.append(ModelPosition(
            title: "NFLX",
            subtitle: "Netflix, Inc",
            portfolioValueNum: "$88.91",
            stockPriceNum: "$2,111.03",
            lineChart: .clear,
            graphData: [],
            isGreen: true
        ))
        
        return list
    }
    
    private func configureButton() {
        confirmBtn.setTitleColor(.white, for: .normal)
        confirmBtn.titleLabel?.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
    }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    /*
    +++++++++++++++++++++++++++
     
     let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StockCellFullController") as! StockCellFullController
     
     viewController.modalPresentationStyle = .fullScreen
     
     self.present(viewController, animated: true)
   ++++++++++++++++++++++++++++++
     
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
    }*/
}

