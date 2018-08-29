package net.hb.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BankCheck {

	@Before("execution(public* net.hb.dao..*(..))")
	public void open() {
		System.out.println("�ŷ��� �α���, ���ȸ�⼳ġ");
		System.out.println("ActiveX���ȸ��");
	}

	@After("execution(public* net.hb.dao..*(..))")
	public void close() {
		System.out.println("�ŷ��� ������ �ŷ�����, ���ϰŷ�����");
		System.out.println("�˸��޽���");
	}
}
