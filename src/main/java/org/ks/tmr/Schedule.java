package org.ks.tmr;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Schedule {
	@Scheduled(cron="5 * * * * *")
	public void scheduleTest2() {
		System.out.println("크론탭 출력(매번 5초일 때 마다)");
	}
}
