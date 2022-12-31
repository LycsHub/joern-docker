modified by official joern dockerfile,remove build scala source code use sbt,just use latest joern cli release.

changes:
- Remove --scan funciton needs default query-db (to impove build speed in China),you can remove it in Dockerfile.
- Use ghproxy impove speed when download form Github.



修改自官方版本的dockerfile,删去了从源码开始构建,直接使用官方预编译发行版.
相关修改:
- 移除了scan功能自带的默认的规则数据,有需要下载joern的默认规则可以在dockefile中找到相关注释下载(为了提高国内下载速度,会从github拉取一个规则包)
- 使用ghproxy提高国内网络环境下载速度
