# Swift_GCD_Study

> 本项目旨在研究与学习Swift多线程技术

[初始化](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/初始化.playground)

简单初始化

```
let queue = DispatchQueue(label: "com.queue")
```

属性指明初始化

```
let queueDetail = DispatchQueue(label: label, qos: qos, attributes: attributes, autoreleaseFrequency: autoreleaseFrequency, target: nil)
```

[QoS指定方式](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/QoS指定方式.playground)


```
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
```

[队列](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/队列.playground)

**系统队列：**

串型队列 `DispatchQueue.main`
并行队列 `DispatchQueue.global()`、 ` DispatchQueue.global(qos: DispatchQoS.QoSClass)`

**自定义队列：**

串型队列 `DispatchQueue(label: String)`
并行队列 `DispatchQueue(label: String, qos: DispatchQoS, attributes: DispatchQueue.Attributes, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue)`

**手动触发** `.activate()`

[封装为对象](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/封装为对象.playground)

[组管理](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/组管理.playground)

`.async(group: DispatchGroup)`
`Group.enter / Group.leave`


[线程挂起与继续](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/线程挂起与继续.playground)

[线程同步](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/线程同步.playground)

[延迟执行](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/延迟执行.playground)

[Semaphore 信号量](https://github.com/ZhangYizhe/Swift_GCD_Study/tree/master/Semaphore信号量.playground)

