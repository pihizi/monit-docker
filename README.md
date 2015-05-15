# monit-docker

## TODO
1. 明确需要监控的docker-container-name，如果有一个或者更多的container不正常，
   就需要尝试重启
2. 如果重启尝试失败5次，则发送邮件提醒
3. 监控docker主进程，如果主进程挂掉，则发送邮件提醒
