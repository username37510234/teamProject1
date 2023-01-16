package today.whatdo.festival.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LogAOP {

	@Around("execution( * today.whatdo.festival.controller..*Controller.*(..))")
	public Object aroundController(ProceedingJoinPoint pjp) throws Throwable {
		String signatureInfo = getSignatureInfo(pjp);
		log.debug("start==>{}",signatureInfo);
		long sTime = System.currentTimeMillis();
		Object obj = pjp.proceed();
		long eTime = System.currentTimeMillis();
		log.debug("end==>{}",signatureInfo);
		log.debug("execute time=>{}", (eTime-sTime)/1000.00);
		return obj;
	}
	private String getSignatureInfo(JoinPoint joinPoint) {
		String signatureName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getSimpleName();
		StringBuilder sb = new StringBuilder();
		sb.append(className).append('.').append(signatureName).append('(');
		Object[] args = joinPoint.getArgs();
		if (args != null && args.length > 0) {
			for (int i = 0; i < args.length; i++) {
				if (args[i] instanceof String)
					sb.append('\"');
				sb.append(args[i]);
				if (args[i] instanceof String)
					sb.append('\"');
				if (i < args.length - 1) {
					sb.append(',');
				}
			}
		}
		sb.append(')');
		return sb.toString();
	}

}
