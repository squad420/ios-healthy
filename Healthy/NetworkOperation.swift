import Foundation

open class NetworkOperation: Operation {
    
    fileprivate var _ready: Bool
    open override var isReady: Bool {
        get { return _ready }
        set { update({ self._ready = newValue }, key: "isReady") }
    }
    
    fileprivate var _executing: Bool
    open override var isExecuting: Bool {
        get { return _executing }
        set { update({ self._executing = newValue }, key: "isExecuting") }
    }
    
    fileprivate var _finished: Bool
    open override var isFinished: Bool {
        get { return _finished }
        set { update({ self._finished = newValue }, key: "isFinished") }
    }
    
    fileprivate var _cancelled: Bool
    open override var isCancelled: Bool {
        get { return _cancelled }
        set { update({ self._cancelled = newValue }, key: "isCancelled") }
    }
    
    fileprivate func update(_ change: (Void) -> Void, key: String) {
        willChangeValue(forKey: key)
        change()
        didChangeValue(forKey: key)
    }
    
    override init() {
        _ready = true
        _executing = false
        _finished = false
        _cancelled = false
        super.init()
        name = "Network Operation"
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
    
    open override func start() {
        if self.isExecuting == false {
            self.isReady = false
            self.isExecuting = true
            self.isFinished = false
            self.isCancelled = false
            print("\(self.name!) operation started.")
        }
    }
    
    /// Used only by subclasses. Externally you should use `cancel`.
    func finish() {
        print("\(self.name!) operation finished.")
        self.isExecuting = false
        self.isFinished = true
    }
    
    open override func cancel() {
        print("\(self.name!) operation cancelled.")
        self.isExecuting = false
        self.isCancelled = true
    }
}
