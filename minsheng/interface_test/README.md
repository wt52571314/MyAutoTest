###脚本执行原理
- ######注意事项
    
***
- ######实现原则
    1. 先登录获取cookie
    2. 使用cookie遍历get&&post接口列表
    3. check返回结果并给出日志
    4. 登出
***
- ######脚本释义：
	1. config_list.py------不执行，用于存储所有final值
	2. base_function.py------登录，post，get，check方式
	3. interface_unit.py-------用于测试单个接口的工具
	4. test_room.py ---------基础功能实验室
	5. main_test.py-------主程序
