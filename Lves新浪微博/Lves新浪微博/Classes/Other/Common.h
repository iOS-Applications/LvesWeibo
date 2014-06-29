

//1. 判断是否是ipone5
#define iphone5 ([UIScreen mainScreen].bounds.size.height==568)

//2. 日志输出的宏定义

#ifdef DEBUG
//调试状态
#define MyLog(...)  NSLog(__VA_ARGS__)

#else
//发布状态
#define MyLog(...)
#endif