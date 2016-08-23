import Foundation

class NetworkLayerConfiguration {
    
    class func setup() {
        // Backend Configuration
        let url = NSURL(string: "http://beta.json-generator.com")!
        let conf = BackendConfiguration(baseURL: url)
        BackendConfiguration.shared = conf
        
        // Network Queue
        NetworkQueue.shared = NetworkQueue()
    }
}
