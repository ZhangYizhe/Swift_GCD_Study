import UIKit

/// MARK: - 挂起与继续
let concurrentQueue = DispatchQueue(label: "com.queue")
concurrentQueue.resume() // 挂起 占用资源不释放
concurrentQueue.suspend() // 继续
