# 概述

dtle (Data-Transformation-le) 是[上海爱可生信息技术股份有限公司](http://www.actionsky.com/) 开发并开源的 [CDC](https://en.wikipedia.org/wiki/Change_data_capture) 工具. 其功能特点是: 
- 多种数据传输模式
	- 支持链路压缩
	- 支持同构传输和异构传输
	- 支持跨网络边际的传输	
- 多种数据处理模式
	- 支持库/表/行级别 数据过滤
- 多种数据通道模式
	- 支持多对多的数据传输
	- 支持回环传输
- 多种源/目标端
	- 支持MySQL - ActionDB的数据传输
        - 支持MySQL - MySQL的数据传输
	- 支持MySQL - Kafka的数据传输
	- 支持Oracle - MySQL的数据传输
- 集群模式
	- 提供可靠的元数据存储
	- 可进行自动任务分配
	- 支持自动故障转移
