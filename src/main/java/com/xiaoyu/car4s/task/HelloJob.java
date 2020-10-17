package com.xiaoyu.car4s.task;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class HelloJob {

	@Scheduled(cron = "0 * * * * ?")
	public void sayHelloEveryMin() {
		System.out.println("=======Hi!哈哈哈哈    " + new Date());
	}
}
