import UIKit

/// MARK: - 队列

//  系统队列
let mainQueue = DispatchQueue.main //串型队列
let globalQueue = DispatchQueue.global() //并行队列
let globalQueueWithQos = DispatchQueue.global(qos: .userInitiated)

/*
 .userInteractive
 用户交互 优先级最高 计算拖拽等操作
 .default
 默认
 .unspecified
 未指定
 .userInitiated
 用户启动 需要立刻知道结果
 .utility
 公共 长时间执行再通知用户 如下载文件
 .background
 后台 用于在后台存储数据等
 */

// 串行队列
let serialQueue = DispatchQueue(label: "com.serialQueue")

// 并行队列
let concurrentQueue = DispatchQueue(label: "com.concurrentQueue", attributes: .concurrent)

// 创建并行队列并手动触发
let concurrentInitiallyInactiveQueue = DispatchQueue(label: "com.concurrentInitiallyInactiveQueue", attributes: [.concurrent, .initiallyInactive])

// 手动触发
concurrentInitiallyInactiveQueue.activate()
