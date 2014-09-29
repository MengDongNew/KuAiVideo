//
//  WebHeader.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-23.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#ifndef KuAiVideo_WebHeader_h
#define KuAiVideo_WebHeader_h



#endif
// *KuAiVideo
// * client_id：7b990e5a68041d02  client_secret： cc5fd0f505114abfa3780583c0468c84
#define Client_id @"7b990e5a68041d02"
#define Client_secret @"cc5fd0f505114abfa3780583c0468c84"
/*
 *
 *步骤说明
 客户端发起授权请求
 GET /v2/oauth2/authorize?client_id=XXXX&response_type=code&state=xyz&redirect_uri=https://client.example.com/cb HTTP/1.1
 Host: openapi.youku.com
 
 请求用户授权(oauth2/authorize)
 接口
 
 URL	https://openapi.youku.com/v2/oauth2/authorize
 HTTP方法	GET
 返回格式	html
 授权/登录	false
 参数
 
 参数	类型	必选	默认值	说明	示例
 client_id	string	true	 	应用Key
 response_type	string	true	 	授权码方式(Authorization Code): code	code
 redirect_uri	string	true	 	授权跳转地址，必须和应用设置的跳转地址相匹配
 state	string	false	 	状态保持参数，授权完成跳转会回传此参数
 返回结果
 3.1 字段说明
 参数	类型	允许为空	说明	示例
 code	string	false	用户授权码，用于交换Access Token
 state	string	false	状态保持参数
 3.2 JSON
 
 1
 2
 3
 4
 5
 // 请求授权
 https://openapi.youku.com/v2/oauth2/authorize?client_id=10000&response_type=code&redirect_uri=http%3A%2F%2Fclient.example.com%2Fcb&state=xyz
 
 // 用户授权后重定向
 http://client.example.com/cb?code=8aee60afd7d3f616cd20b9bed236bb7d&state=xyz

 //
#define Authorize @"openapi.youku.com/v2/oauth2/authorize?client_id=7b990e5a68041d02&response_type=code&state=xyz&redirect_uri=https://client.example.com/cb"
 
 /*
 授权页面等待用户授权，如果授权成功，则携带用户授权码跳转到指定的URL
 HTTP/1.1 302 Found
 Location: https://client.example.com/cb?code=SplxlOBeZQQYbYS6WxSbIA&state=xyz
 
 应用的服务器端获取用户授权码，并向授权服务器申请令牌
 POST /v2/oauth2/token HTTP/1.1
 Host: openapi.youku.com
 
 client_id=XXXX&client_secret=XXXX&grant_type=authorization_code&code=SplxlOBeZQQYbYS6WxSbIA&redirect_uri=https://client.example.com/cb
 
 应用服务器获得令牌，保存下来，以便下次使用
 
 HTTP/1.1 200 OK
 Content-Type: application/json;charset=UTF-8
 
 {
 "access_token":"8b5457ea585622626daba8eb6ccce1f5",
 "expires_in":"2592000",
 "refresh_token":"e018da5ce2ee77092121ac6beefefd5b",
 "token_type":"bearer"
 }
 
 */
