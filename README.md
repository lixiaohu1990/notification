### 缘由，为了测试多线程环境下，发送跟处理通知的线程跟添加通知线程不是同一个线程时，回调执行的过程中对象如果被释放时，会发生奔溃。

### 测试结果：当我在ViewController里面把Observer实例置为nil的时候，没有马上调用Observer的dealloc方法，而是等通知处理事件结束后才调用dealloc，但是我也没有用block引用Observer，为什么当Observer实例置为nil的时候，不会马上调用dealloc方法呢？

### 问题：为什么Observer调用dealloc要在 `handleNotification`调用结束后才会释放呢，sleep()也只是阻塞了当前线程吧，而调用dealloc（在主队列置Observer的实例为nil）的线程跟handleNotification（在全局队列中发送通知）的线程应该不是在同一个线程啊，为什么还会被sleep阻塞。。



