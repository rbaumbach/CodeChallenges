import UIKit

protocol Dispatcher {
    func dispatchOnMainQueue(execute: @escaping () -> Void)
}

class DispatcherForQueue: Dispatcher {
    func dispatchOnMainQueue(execute: @escaping () -> Void) {
        DispatchQueue.main.async(execute:execute)
    }
}

class AsyncEvenOddStringConcatenation {
    // MARK: - Given property and methods
    
    var testLabel: UILabel = UILabel()
    
    private var dispatcher: Dispatcher
    
    private func getRemoteFirstString(completionBlock: @escaping (String) -> Void) {
        completionBlock("Billy")
    }

    private func getRemoteSecondString(completionBlock: @escaping (String) -> Void) {
        completionBlock("Goat")
    }
    
    // MARK: - Init Method
    
    init(dispatcher: Dispatcher = DispatcherForQueue()) {
        self.dispatcher = dispatcher
    }
    
    // MARK: - Methods to implement
    
    func buildString(using integer: Int, completionBlock: @escaping (String) -> Void) {
        if integer % 2 == 0 {
            getRemoteFirstString { [weak self] firstString in
                self?.getRemoteSecondString { secondString in
                    completionBlock(firstString + secondString)
                }
            }
        } else {
            getRemoteFirstString { string in
                completionBlock(string)
            }
        }
    }
    
    func buildStringForLabel(using integer: Int) {
        if integer % 2 == 0 {
            getRemoteFirstString { [weak self] firstString in
                self?.getRemoteSecondString { [weak self] secondString in
                    self?.dispatcher.dispatchOnMainQueue {
                        self?.testLabel.text = firstString + secondString
                    }
                }
            }
        } else {
            getRemoteFirstString { [weak self] firstString in
                self?.dispatcher.dispatchOnMainQueue {
                    self?.testLabel.text = firstString
                }
            }
        }
    }
}
