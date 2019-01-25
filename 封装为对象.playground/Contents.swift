import UIKit

/// MARK: - 封装为对象

let item = DispatchWorkItem {
    print(123)
}

// 可在初始化时指定更多参数
let item2 = DispatchWorkItem(qos: .userInitiated, flags: [.enforceQoS,.assignCurrentContext]) {
    print(456)
}

DispatchQueue.global().async(execute: item2)
