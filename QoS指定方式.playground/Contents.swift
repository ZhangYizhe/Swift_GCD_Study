import UIKit

/// MARK: - QoS指定方式 队列质量

/*
 .userInteractive
 用户交互 优先级最高 计算拖拽等操作
 .default
 默认
 .unspecified
 未指定
 .userInitiated
 用户主动触发 需要立刻知道结果
 .utility
 公共 长时间执行再通知用户 如下载文件
 .background
 后台 用于在后台存储数据等
 */


// 创建时制定
let backgroundQueue = DispatchQueue(label: "backgroundQueue", qos: .background)
backgroundQueue.async {

}

// 提交block时指定
let queue = DispatchQueue(label: "backgroundQueue")
queue.async(qos: .background) {

}
