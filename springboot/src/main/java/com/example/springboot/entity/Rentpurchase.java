package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import cn.hutool.core.annotation.Alias;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2023-03-11
 */
@Getter
@Setter
@ApiModel(value = "Rentpurchase对象", description = "")
public class Rentpurchase implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户id")
    @Alias("用户id")
    private Integer userid;

    @ApiModelProperty("渔具名称")
    @Alias("渔具名称")
    private String name;

    @ApiModelProperty("购买或者租赁")
    @Alias("购买或者租赁")
    private String type;

    @ApiModelProperty("价格")
    @Alias("价格")
    private BigDecimal price;

    @ApiModelProperty("用户名称")
    @Alias("用户名称")
    private String username;


}
