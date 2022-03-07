import UIKit

protocol CategoryListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var viewModel: CategoriesViewModel!
    private var service = CategoryService()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CategoriesViewModel(service: self.service, delegate: self)
        self.viewModel?.getCategories()
        setupView()

//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        getCategories()
    }

    private func setupView(){
        self.title = "Category"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(UINib(nibName: "CategoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryListTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension CategoriesViewController: CategoryListDelegate {
    func toogleLoading() {
        
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showError() {
        
    }
}

extension CategoriesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        print(viewModel.getCategory(at: indexPath.row))
        showQuestions(for: viewModel.getCategory(at: indexPath.row))
    }

    private func showQuestions(for category: Category) {
        let questionViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        questionViewController.title = category.name
        questionViewController.categoryID = category.id

        navigationController?.pushViewController(questionViewController, animated: true)
    }

}

extension CategoriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getCategoriesCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListTableViewCell", for: indexPath) as! CategoryListTableViewCell

        cell.categoryName.text = self.viewModel?.getCategory(at: indexPath.row).name

        return cell

    }
    
    
}
