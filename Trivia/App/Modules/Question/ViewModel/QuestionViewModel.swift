
import Foundation

class QuestionViewModel {
    
    private let questionsService: QuestionsService
    private var questions = [Question]()
    private var currentQuestionIndex = 0


    init(service: QuestionsService) {
        self.questionsService = service
    }

    func getQuestions(for categoryID: Int?, completion: @escaping () -> Void) {
        questionsService.getQuestions{ questions in
            self.questions = questions
            completion()
        } onError: {

        }
    }
    
    func areQuestionsAvailable() -> Bool {
        !questions.isEmpty
    }
    
    func questionsCount() -> Int{
        questions.count
    }
    
    func getQuestion(at index: Int) -> Question {
        questions[index]
    }
    
    func getNextQuestion() -> String {
        updateIndex()
        return getCurrentQuestion()
    }
    
    func getCurrentQuestion() -> String {
        if needsToResetIndex() {
            resetIndex() }
        return questions[currentQuestionIndex].question //permite tener la pregunta actual
    }
    
    private func updateIndex() {
        currentQuestionIndex += 1
    }
    
    private func resetIndex() {
        currentQuestionIndex = 0
    }
    
    private func needsToResetIndex() -> Bool {
        currentQuestionIndex >= questions.count
    }
    
    func validateCurrentQuestion(answer: Bool) -> Bool {
        let answerSelected = answer
        let answerCorrect = (questions[currentQuestionIndex].correct_answer as NSString).boolValue
        return answerSelected == answerCorrect
    }
    
}
