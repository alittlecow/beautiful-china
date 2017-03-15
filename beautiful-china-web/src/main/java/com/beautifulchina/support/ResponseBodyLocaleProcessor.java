package com.beautifulchina.support;

import com.beautifulchina.util.CommUtil;
import com.beautifulchina.util.ReflectionUtils;
import org.springframework.core.MethodParameter;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodProcessor;

import javax.annotation.Resource;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.List;

/**
 * @author pengx
 * @date 2017/3/15
 */
public class ResponseBodyLocaleProcessor extends AbstractMessageConverterMethodProcessor {

    @Resource
    private LocaleSupport localeSupport;


    public ResponseBodyLocaleProcessor(List<HttpMessageConverter<?>> messageConverters) {
        super(messageConverters);
    }

    public boolean supportsParameter(MethodParameter parameter) {
        return false;
    }

    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        return null;
    }

    public boolean supportsReturnType(MethodParameter returnType) {

        return getAnnotation(returnType) != null;
    }


    private Annotation getAnnotation(MethodParameter returnType) {
        ResponseBodyLocale annotation = returnType.getMethodAnnotation(ResponseBodyLocale.class);
        if (annotation == null) {
            AnnotationUtils.findAnnotation(returnType.getContainingClass(), ResponseBodyLocale.class);
        }
        return annotation;
    }

    public void handleReturnValue(Object returnValue, MethodParameter returnType, ModelAndViewContainer mavContainer, NativeWebRequest webRequest) throws Exception {

        mavContainer.setRequestHandled(true);
        //获取国际化语言
        String local = "en";
        // TODO: 2017/3/15
        //对本地化字段进行更新
        doProcess(returnValue, local);
        writeWithMessageConverters(returnValue, returnType, webRequest);
    }

    private Object doProcess(Object returnValue, String local) throws IllegalAccessException {
        Field[] fields = returnValue.getClass().getDeclaredFields();
        for (Field f : fields) {
            Locale localeAnnotation = f.getAnnotation(Locale.class);
            if (localeAnnotation != null) {
                String fieldName = f.getName();
                String key = (String) ReflectionUtils.getFieldValue(returnValue, fieldName);
                String newContent = localeSupport.getLanguageContent(key, local);
                ReflectionUtils.invokeSetterMethod(returnValue, fieldName, newContent);
            }
        }
        return returnValue;
    }
}
