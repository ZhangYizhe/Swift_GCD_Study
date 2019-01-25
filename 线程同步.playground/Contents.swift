import UIKit

/// MARK: - 线程同步

// NSLock 互斥锁
let lock = NSLock()
lock.lock()
// 操作
lock.unlock()

//sync 同步函数
class SomeData {
    private var privateData : Int = 0
    private let dataQueue = DispatchQueue(label: "com.dataQueue")
    var data : Int {
        get {
            return dataQueue.sync { privateData }
        }
        set {
            dataQueue.sync { privateData = newValue }
        }
    }
}

let someData = SomeData()
let lock = NSLock() // 设置互斥锁
let group = DispatchGroup() // 设置组
for i in 0...10 {
    group.enter() // 进组
    DispatchQueue.global().async {
        lock.lock() //锁住线程准备数据操作
        someData.data = someData.data + 1 // 数据操作
        lock.unlock() // 释放锁
        group.leave() //退组
    }
}
group.notify(queue: .main) { //线程结束后通知
    print(someData.data)
}

/// MARK: - Barrier 线程阻断
// barrier提交后，会等待在它之前的全部任务完成后执行，且等待它完成后才会执行后面的任务

let concurrentQueue = DispatchQueue(label: "com.concurrent", attributes: .concurrent)
concurrentQueue.async {
    sleep(2)
    print(1)
}
concurrentQueue.async {
    sleep(2)
    print(2)
}
concurrentQueue.async(flags: .barrier) {
    print("start")
    print(3)
    print("end")
    sleep(2)
}
concurrentQueue.async() {
    print(4)
}
