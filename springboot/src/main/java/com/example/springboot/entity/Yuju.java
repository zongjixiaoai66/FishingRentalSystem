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
@ApiModel(value = "Yuju对象", description = "")
public class Yuju implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("渔具名称")
    @Alias("渔具名称")
    private String name;

    @ApiModelProperty("渔具图片")
    @Alias("渔具名称")
    private String img;

    @ApiModelProperty("类型")
    @Alias("类型")
    private String type;

    @ApiModelProperty("租赁数量")
    @Alias("租赁数量")
    private Integer renttotal;

    @ApiModelProperty("租赁价格")
    @Alias("租赁价格")
    private BigDecimal rentprice;

    @ApiModelProperty("购买数量")
    @Alias("购买数量")
    private Integer purchasetotal;

    @ApiModelProperty("购买价格")
    @Alias("购买价格")
    private BigDecimal purchaseprice;


}
