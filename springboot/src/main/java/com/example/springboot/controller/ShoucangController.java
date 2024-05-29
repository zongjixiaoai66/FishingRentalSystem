package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.Yuju;
import com.example.springboot.service.IYujuService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.entity.User;
import com.example.springboot.utils.TokenUtils;
import com.example.springboot.service.IUserService;

import com.example.springboot.service.IShoucangService;
import com.example.springboot.entity.Shoucang;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2023-03-18
 */
@RestController
@RequestMapping("/shoucang")
public class ShoucangController {

    @Resource
    private IShoucangService shoucangService;
    @Resource
    IUserService userService;


    @Resource
    private IYujuService yujuService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Shoucang shoucang) {
        if (shoucang.getId() == null) {
            //shoucang.setTime(DateUtil.now());
            //shoucang.setUser(TokenUtils.getCurrentUser().getNickname());
            //shoucang.setUserid(TokenUtils.getCurrentUser().getId());
        }
        shoucangService.saveOrUpdate(shoucang);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        shoucangService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        shoucangService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(shoucangService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(shoucangService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer userid,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Shoucang> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        queryWrapper.eq("userid",userid);
        List<Shoucang> list = shoucangService.list(queryWrapper);
        List<Integer> rujuIdList = new ArrayList<>();
        for (Shoucang shoucang : list) {
            rujuIdList.add(shoucang.getYujuid());
        }
        QueryWrapper<Yuju> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.like("name",name);
        queryWrapper1.in("id",rujuIdList);
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("userid", currentUser.getId());
//        }
        return Result.success(yujuService.page(new Page<>(pageNum, pageSize), queryWrapper1));
    }
    @GetMapping("/cancel")
    public Result cancel(@RequestParam Integer userid,
                           @RequestParam Integer id) {
        QueryWrapper<Shoucang> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("userid",userid);
        queryWrapper1.eq("yujuid",id);
        boolean remove = shoucangService.remove(queryWrapper1);
        if(remove){
            return Result.success();
        }else{
            return Result.error("400","取消收藏失败，请联系管理员解决");
        }
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Shoucang> list = shoucangService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Shoucang信息表", "UTF-8");
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
        List<Shoucang> list = reader.readAll(Shoucang.class);

        shoucangService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

