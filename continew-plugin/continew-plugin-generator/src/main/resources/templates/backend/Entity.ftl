package ${packageName}.${subPackageName};

import java.io.Serial;
<#if hasTimeField>
import java.time.*;
</#if>
<#if hasBigDecimalField>
import java.math.BigDecimal;
</#if>
<#if hasJsonField>
    import com.alibaba.fastjson2.JSONObject;
    import com.baomidou.mybatisplus.annotation.TableField;
    import com.baomidou.mybatisplus.extension.handlers.Fastjson2TypeHandler;
</#if>

import lombok.Data;

import com.baomidou.mybatisplus.annotation.TableName;

import top.continew.starter.extension.crud.model.entity.BaseDO;

/**
 * ${businessName}实体
 *
 * @author ${author}
 * @since ${datetime}
 */
@Data
@TableName(value = "${tableName}"<#if hasJsonField>, autoResultMap = true</#if>)
public class ${className} extends BaseDO {

    @Serial
    private static final long serialVersionUID = 1L;
<#if fieldConfigs??>
  <#list fieldConfigs as fieldConfig>

    /**
     * ${fieldConfig.comment}
     */
      <#if fieldConfig.fieldType == "JSONObject">
          @TableField(typeHandler = Fastjson2TypeHandler.class)
      </#if>
    private ${fieldConfig.fieldType} ${fieldConfig.fieldName};
  </#list>
</#if>
}