import UIKit

/// MARK: - DispatchGroup 管理一组任务执行 并监听任务是否完成

// 普通方式
let group = DispatchGroup()

let queueA = DispatchQueue(label: "queueA")
print("start task queueA")
queueA.async(group: group) {
    sleep(2)
    print("end task queueA")
}
let queueB = DispatchQueue(label: "queueB")
print("start task queueB")
queueB.async(group: group) {
    sleep(1)
    print("end task queueB")
}
group.notify(queue: DispatchQueue.main) {
    print("all task done")
}


// Group.enter / Group.leave

print("Group Created")
let group = DispatchGroup()
group.enter()
task(label: "1", cost: 2) {
    group.leave()
}
group.enter()
task(label: "2", cost: 2) {
    group.leave()
}

group.wait(timeout: .now() + .seconds(4)) //阻塞当前线程

group.notify(queue: .main) {
    print("all task is done")
}

/// - Parameters: 延时任务
///   - label: 任务标题
///   - cost: 延时
///   - complete: 回调
func task(label: String, cost: UInt32, complete:@escaping ()->()){
    print("start task \(label)")
    DispatchQueue.global().async {
        sleep(cost)
        DispatchQueue.main.async {
            complete()
        }
    }
}
