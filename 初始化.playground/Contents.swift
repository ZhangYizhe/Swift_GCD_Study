import UIKit
/// MARK: - 简单初始化

let queue = DispatchQueue(label: "com.queue")

/// MARK: - 属性指明初始化队列

let label = "com.queue"
let qos = DispatchQoS.default // quality of service 队列质量

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

let attributes = DispatchQueue.Attributes.concurrent // 队列属性 默认串行 .concurrent 并行 .initiallyInactive 需手动触发
let autoreleaseFrequency = DispatchQueue.AutoreleaseFrequency.never //自动释放频率


let queueDetail = DispatchQueue(label: label, qos: qos, attributes: attributes, autoreleaseFrequency: autoreleaseFrequency, target: nil)
