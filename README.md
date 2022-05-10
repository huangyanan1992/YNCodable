# YNCodable
YNCodable是基于swift4新特性Codable封装的一行代码实现json与model的映射，如果你还不了解Codable新特性，可以查阅[官方文档](https://developer.apple.com/documentation/swift/encoding_decoding_and_serialization)
# 使用
**1. 常规json串**
    
   	let response = """
                    {
                     "list": [
                        {
                          "title": "title1 ",
                          "series": "series"
                        },
                        {
                          "title": "title2"
                        }
                     ]
                    }
                   """
				    
该json串中list数组有两个字段，字段title均有值，字段series可能没有值。我们可以定义如下Model：

    struct ResponseList: Codable {
	  var list: [List] = [List]()
	}
	
	struct List: Codable {
	  var title: String = ""
	  var series: String?
	}
> 注意这里series是optional, 我们假定服务端是不靠谱的，所以所有字段都应该是optional，或者有默认值。

使用YNCodable解析

    let responseList = ResponseList.decode(from: response)
其实这里也可以这么解析

    let list = [List].decode(from: response)
**2. 带keyPath的json串**

很多时候服务器返回的json串往往不是直接解析，需要取一层，有时候可能还要取多层，YNCodable提供了带keyPath的解析方式。如下json：

    let responseRes = """
                      {
                        "test": {
                          "res": {
                              "list": [
                                  {
                                    "title": "title1 ",
                                    "series": "series"
                                  },
                                  {
                                    "title": "title2"
                                  }
                              ]
                            }
                          }
                        }
                   """
这里还是解析list

    let responseListFromKeypath = ResponseList.decode(from: responseRes, keyPath: "test.res")
或者直接返回数组
    
    listFromKeyPath = [List].decode(from: responseRes, keyPath: "test.res.list")
# 要求
* Xcode9
* swift

# 安装
YNCodable不包含任何依赖
# CocoaPods
   
    # Podfile
	use_frameworks!
	
	target 'YOUR_TARGET_NAME' do
		pod 'YNCodable'
	end
	
在Podfile文件中替换 YOUR_TARGET_NAME 进入到项目目录执行

    $ pod install
 




