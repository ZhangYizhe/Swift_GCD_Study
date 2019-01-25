import UIKit

/// MARK: - 延迟执行
// DispatchTime 纳秒级操作
let deadline = DispatchTime.now() + 2.0
print("start")
DispatchQueue.global().asyncAfter(deadline: deadline) {
    print("End")
}
// DispatchWallTime 微妙级操作
let walltime = DispatchWallTime() + 2.0
print("start")
DispatchQueue.global().asyncAfter(deadline: walltime) {
    print("End")
}
