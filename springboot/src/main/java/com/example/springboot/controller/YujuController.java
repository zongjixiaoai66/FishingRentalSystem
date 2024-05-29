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
import com.example.springboot.entity.Rentpurchase;
import com.example.springboot.entity.Shoucang;
import com.example.springboot.service.IShoucangService;
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

import com.example.springboot.service.IYujuService;
import com.example.springboot.entity.Yuju;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author
 * @since 2023-03-11
 */
@RestController
@RequestMapping("/yuju")
public class YujuController {

    @Resource
    private IYujuService yujuService;
    @Resource
    IUserService userService;
    @Resource
    IShoucangService shoucangService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Yuju yuju) {
        if (yuju.getId() == null) {
            //yuju.setTime(DateUtil.now());
            //yuju.setUser(TokenUtils.getCurrentUser().getNickname());
            //yuju.setUserid(TokenUtils.getCurrentUser().getId());
        }
        yujuService.saveOrUpdate(yuju);
        return Result.success();
    }




    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        yujuService.removeById(id);
        return Result.success();
    }


    @PostMapping("/shoucang/{id}/{userid}")
    public Result shoucang(@PathVariable Integer id,@PathVariable Integer userid) {
        Shoucang shoucang = new Shoucang();
        shoucang.setYujuid(id);
        shoucang.setUserid(userid);
        QueryWrapper<Shoucang> wrapper = new QueryWrapper<>();
        wrapper.eq("userid",userid);
        wrapper.eq("yujuid",id);
        List<Shoucang> list = shoucangService.list(wrapper);
        if(null != list && list.size() != 0){
            return Result.error("400","已经收藏，无法重复收藏");
        }
        boolean save = shoucangService.save(shoucang);
        if(save){
            return Result.success();
        }else{
            return Result.error("400","收藏失败，请联系管理员");
        }
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        yujuService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(yujuService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(yujuService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Double minPrice,
                           @RequestParam Double maxPrice,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Yuju> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        if(null != minPrice && !minPrice.equals(0.0)){
            queryWrapper.gt("rentprice",minPrice);
            queryWrapper.gt("purchaseprice",minPrice);
        }
        if(null != maxPrice && !maxPrice.equals(0.0)){
            queryWrapper.le("rentprice",maxPrice);
            queryWrapper.le("purchaseprice",maxPrice);
        }
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("userid", currentUser.getId());
//        }
        return Result.success(yujuService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
     * 导出接口
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Yuju> list = yujuService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Yuju信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /**
     * excel 导入
     *
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Yuju> list = reader.readAll(Yuju.class);

        yujuService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

