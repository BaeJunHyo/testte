package cd.com.a.util;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;



public class CaptChaUtil {
	public CaptChaUtil() {
		
	}
	private static final long serialVersionUID = 1L;
    
    /*CaptCha Image 생성*/
    public void capthcaImg(HttpServletRequest req, HttpServletResponse resp) {
        
        Captcha captcha = new Captcha.Builder(200,60)
                //.addText() 또는 아래와 같이 정의    
                //6자리 숫자와 폰트를 설정한다.
                .addText(new NumbersAnswerProducer(6))
                // BlockGimpyRenderer,FishEyeGimpyRenderer,RippleGimpyRenderer,ShearGimpyRenderer,StretchGimpyRenderer
                .addNoise().addNoise().addNoise()
                .addBackground(new GradiatedBackgroundProducer())
                .addBorder()
                .build();

          //JSP에서 Captcha 객체에 접근할 수 있도록 Session에 저장한다.
        req.getSession().setAttribute("simpleCaptcha", captcha.getAnswer()); //NAME = Captcha.NAME = 'simpleCaptcha'
          CaptchaServletUtil.writeImage(resp, captcha.getImage());
          System.out.println("code="+captcha.getAnswer());
     }

   
}