
import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
        
    private var viewModel: QuestionViewModel!

    var categoryID: Int?
    
    override func viewDidLoad() {
        viewModel = QuestionViewModel(service: QuestionsService())
        getQuestions()
    }
    
    private func getQuestions() {
        viewModel.getQuestions(for: categoryID) { [weak self] in
            guard let strongSelf = self else {return}
            if strongSelf.viewModel.areQuestionsAvailable(){
                strongSelf.setCurrentQuestion()
            }
        }
    }
    
    @IBAction func wrongAnswerTapped(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: false)
        sendResultMessage(for: result)
    }

    @IBAction func rightAnswerTapped(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: true)
        sendResultMessage(for: result)
    }
    
    private func updateQuestion(){
        setQuestion(question: viewModel.getNextQuestion())
    }
    
    private func setCurrentQuestion() {
        setQuestion(question: viewModel.getCurrentQuestion())
    }
    
    private func setQuestion(question: String) {
        questionLabel.text = question
    }
    
    private func validateCurrentQuestion(answer: Bool) -> Bool {
        return viewModel.validateCurrentQuestion(answer: answer)
    }
    
    private func sendResultMessage(for result: Bool) {
        let message = result ? "Respuesta Correcta :D" : "Respuesta Incorrecta :("
        
        let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.updateQuestion()
        }))
        self.present(alert, animated: true)
    }
    

}
