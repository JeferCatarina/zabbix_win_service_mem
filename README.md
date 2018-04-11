Collecting memory usage per service based on service name

Requirement: Zabbix Server 2.0+

1. Download files;
2. Add in zabbix_agent.conf as bellow:
	UserParameter=Service_Mem[*],C:\Zabbix\Script\zabbix_win_service_mem\service_mem.bat $1
3. Change var %workdir% in "service_mem.bat", including the path to files;
4. Restart Zabbix Agent;
5. Create item to collect your service memory usage:
	Name: Example
	Type: Zabbix Agent
	Key: Service_Mem[servicename]
	Type of information: Numeric (unsigned)
	Data type: Decimal
	Unit: B
	User custom multiplier: 1048
6. Enjoy it! 
