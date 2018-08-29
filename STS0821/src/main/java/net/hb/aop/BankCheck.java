package net.hb.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BankCheck {

	@Before("execution(public* net.hb.dao..*(..))")
	public void open() {
		System.out.println("거래전 로그인, 보안모듈설치");
		System.out.println("ActiveX보안모듈");
	}

	@After("execution(public* net.hb.dao..*(..))")
	public void close() {
		System.out.println("거래후 폰으로 거래내역, 매일거래내역");
		System.out.println("알림메시지");
	}
}
