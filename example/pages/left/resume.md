---
title: 我的简历 | 左蓝
name: 左蓝
description: 星际生态学 & 星际通信

download_name: "下载"
download_url: ""
blog_url: "http://www.jianshu.com/u/e213f00c7c35"

baseinfo_name: "基本信息"
baseinfo:
    - line: "出生于1995年2月"
    - line: "性别：男"
contact_name: "联系方式"
contact: 
    - line: "邮箱：i@zuolan.me"
    - line: "手机：1234567890"
social_name: "社交信息"
social:
    - line: "微信：@zuo-lan"
    - line: "QQ：792236072"

sitemap:
    changefreq: weekly
    priority: 1.03

content:
    items: @self.children
    order:
        by: date
        dir: desc
    limit: 5
    pagination: true

feed:
    description: 左蓝的个人简历。
    limit: 10
---

