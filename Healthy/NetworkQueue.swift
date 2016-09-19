import Foundation

open class NetworkQueue {
    
    open static var shared: NetworkQueue!
    
    let queue = OperationQueue()
    
    public init() {}
    
    open func addOperation(_ op: Operation) {
        queue.addOperation(op)
    }
}
