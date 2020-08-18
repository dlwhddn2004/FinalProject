package kr.or.ddit.quartz.job;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class TimeCheckJob extends QuartzJobBean {

	// 스케줄링에 따라 executeInternal() 콜백
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY/MM/DD kk:mm:ss");
		System.out.println("timeCheckJob : " +dateFormat.format(new Date()));
		
	}

}
