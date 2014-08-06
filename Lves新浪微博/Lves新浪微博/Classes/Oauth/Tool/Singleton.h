

// .h
#define single_interface(className)  + (className *)shared##className;


// .m
//  \代表下一行也属于宏
// ##是拼接符号
#define single_implementation(className) \
static className *_instance;\
\
+(className *)shared##className{\
    if (_instance==nil) {\
        _instance=[[self alloc] init];\
    }\
    return _instance;\
}\
\
+(id)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance=[super allocWithZone:zone];\
    });\
    return _instance;\
}