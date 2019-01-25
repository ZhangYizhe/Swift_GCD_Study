import UIKit

/// MARK: - Semaphore 信号量
// 控制同时开启线程数量

let semaphore = DispatchSemaphore(value: 2) //设置总量为2
let queue = DispatchQueue(label: "com.concurrentqueue", qos: .default, attributes: .concurrent)

queue.async {
    semaphore.wait() // 开启
    task(label: "1", cost: 2, complete: {
        semaphore.signal() //结束
    })
}

queue.async {
    semaphore.wait()
    task(label: "2", cost: 2, complete: {
        semaphore.signal()
    })
}

queue.async {
    semaphore.wait()
    task(label: "3", cost: 2, complete: {
        semaphore.signal()
    })
}

public func task(label: String, cost: UInt32, complete: @escaping ()->()) {
    print("start task\(label)")
    sleep(cost)
    print("end task\(label)")
    complete()
}
