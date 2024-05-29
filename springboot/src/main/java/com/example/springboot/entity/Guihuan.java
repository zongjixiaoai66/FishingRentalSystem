package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
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
@ApiModel(value = "Guihuan对象", description = "")
public class Guihuan implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户id")
    @Alias("用户id")
    private Integer userid;

    /**
     * 租赁购买记录的id
     */
    @TableField(exist = false)
    private Integer recordid;

    @ApiModelProperty("归还渔具名称")
    @Alias("归还渔具名称")
    private String name;

    @ApiModelProperty("创建时间")
    @Alias("创建时间")
    private String createTime;

    @ApiModelProperty("用户名称")
    @Alias("用户名称")
    private String username;


}
