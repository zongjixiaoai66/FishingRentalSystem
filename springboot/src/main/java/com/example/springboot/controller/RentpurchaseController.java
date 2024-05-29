package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.entity.User;
import com.example.springboot.utils.TokenUtils;
import com.example.springboot.service.IUserService;

import com.example.springboot.service.IRentpurchaseService;
import com.example.springboot.entity.Rentpurchase;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2023-03-11
 */
@RestController
@RequestMapping("/rentpurchase")
public class RentpurchaseController {

    @Resource
    private IRentpurchaseService rentpurchaseService;
    @Resource
    IUserService userService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Rentpurchase rentpurchase) {
        if (rentpurchase.getId() == null) {
            Integer userid = rentpurchase.getUserid();
            User byId = userService.getById(userid);
            BigDecimal money = byId.getMoney();
            if(money.compareTo(rentpurchase.getPrice()) == 1){
                byId.setMoney(money.subtract(rentpurchase.getPrice()));
                userService.updateById(byId);
            }else{
                return Result.error("400","你的余额不足了，无法消费");
            }
        }
        rentpurchaseService.saveOrUpdate(rentpurchase);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        rentpurchaseService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        rentpurchaseService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(rentpurchaseService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(rentpurchaseService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam(defaultValue = "") String role,
                           @RequestParam Integer userid,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Rentpurchase> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        if(role.equals("ROLE_USER")){
            queryWrapper.eq("userid",userid);
        }
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("userid", currentUser.getId());
//        }
        return Result.success(rentpurchaseService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Rentpurchase> list = rentpurchaseService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Rentpurchase信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

        }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Rentpurchase> list = reader.readAll(Rentpurchase.class);

        rentpurchaseService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

