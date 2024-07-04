import UIKit

class PortfolioViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewStockBtn: UIButton!
    
//    let viewModel = PortfolioViewModel()
            
    lazy var viewModel = PortfolioViewModel(
        didFetchPortfolio: { [weak self] in
            self?.tableView.reloadData()
        }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPortfolio()
        viewModel.didFetchPortfolio = { [weak self] in
            self?.tableView.reloadData()
        }
        configureTableView()
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
    }
    
    private func configureButton() {
        addNewStockBtn.setTitleColor(.white, for: .normal)
        addNewStockBtn.titleLabel?.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
    }
}

extension PortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.modelPositionForBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as? StockCell
        else { return UITableViewCell() }
        
        let position = viewModel.modelPositionForBase[indexPath.row]
        
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
