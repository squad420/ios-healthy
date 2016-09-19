import Foundation

open class ServiceOperation: NetworkOperation {
    
    let service: BackendService
    
    public override init() {
        self.service = BackendService(BackendConfiguration.shared)
        super.init()
    }
    
    open override func cancel() {
        service.cancel()
        super.cancel()
    }
}
