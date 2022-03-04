import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var viewModel: CategoriesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CategoriesViewModel(service: CategoryService())
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        getCategories()
    }
    
    func getCategories() {
        viewModel?.getCategories {
            self.tableView.reloadData() //Actualiza la tabla
        }  //Esta informacion de cat no se guardan aca porque estan en el ViewModel
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        showQuestions(for: viewModel.getCategory(at: indexPath.row))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCategoriesCount()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = viewModel.getCategory(at: indexPath.row).name
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(named: "Alkemy")
        return cell
    }

    private func showQuestions(for category: Category) {
        let questionViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        questionViewController.title = category.name
        questionViewController.categoryID = category.id

        navigationController?.pushViewController(questionViewController, animated: true)
    }

}
