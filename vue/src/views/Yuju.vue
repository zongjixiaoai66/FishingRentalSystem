<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      价格区间：
      <el-input style="width: 130px" placeholder="最低价格" type="number" v-model="minPrice"></el-input>  -
      <el-input style="width: 130px" placeholder="最高价格" type="number"  v-model="maxPrice"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0" v-if="user.role == 'ROLE_ADMIN'">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
      <!-- <el-upload action="http://localhost:9999/yuju/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button> -->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
      <el-table-column prop="name" label="渔具名称"></el-table-column>
      <el-table-column label="图片"><template slot-scope="scope"><el-image style="width: 100px; height: 100px" :src="scope.row.img" :preview-src-list="[scope.row.img]"></el-image></template></el-table-column>

      <el-table-column prop="type" label="类型"></el-table-column>
      <el-table-column prop="renttotal" label="租赁数量"></el-table-column>
      <el-table-column prop="rentprice" label="租赁价格"></el-table-column>
      <el-table-column prop="purchasetotal" label="购买数量"></el-table-column>
      <el-table-column prop="purchaseprice" label="购买价格"></el-table-column>

      <el-table-column label="操作"  width="400" align="center">
        <template slot-scope="scope">
          <el-button type="primary" @click="shoucang(scope.row.id)">收藏</el-button>
          <el-button type="success" @click="handleEdit(scope.row)" v-if="user.role == 'ROLE_ADMIN'">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定购买吗？"
              @confirm="purchase(scope.row)"
          >
            <el-button type="primary" slot="reference" v-if="user.role == 'ROLE_USER'">购买</el-button>
          </el-popconfirm>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定租赁吗？"
              @confirm="rent(scope.row)"
          >
            <el-button type="primary" slot="reference" v-if="user.role == 'ROLE_USER'">租赁</el-button>
          </el-popconfirm>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference" v-if="user.role == 'ROLE_ADMIN'">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="40%" :close-on-click-modal="false">
      <el-form label-width="140px" size="small" style="width: 85%;" :model="form" :rules="rules" ref="ruleForm">
        <el-form-item prop="name" label="渔具名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="封面">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:9999/file/upload"
              ref="img"
              :show-file-list="false"
              :on-success="handleImgUploadSuccess">
            <img v-if="form.img" :src="form.img" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item prop="type" label="类型">
          <el-input v-model="form.type" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="renttotal" label="租赁数量">
          <el-input v-model="form.renttotal" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="rentprice" label="租赁价格">
          <el-input v-model="form.rentprice" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="purchasetotal" label="购买数量">
          <el-input v-model="form.purchasetotal" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="purchaseprice" label="购买价格">
          <el-input v-model="form.purchaseprice" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Yuju",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      minPrice:null,
      maxPrice:null,
      name: "",
      form: {},
      purchaseForm: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      rules: {
        name: [
          { required: true, message: '请输入名称', trigger: 'blur'}
        ],
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/yuju/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
          minPrice:this.minPrice == null ? 0.0 : this.minPrice ,
          maxPrice:this.maxPrice == null ? 0.0 : this.maxPrice,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    save() {
        this.$refs['ruleForm'].validate((valid) => {
          if (valid) {
            this.request.post("/yuju", this.form).then(res => {
              if (res.code === '200') {
                this.$message.success("保存成功")
                this.dialogFormVisible = false
                this.load()
              } else {
                this.$message.error(res.msg)
              }
            })
          }
        })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.form = {img: ''}
      this.$nextTick(() => {
        if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
      })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
    },
    purchase(row) {
      this.purchaseForm = JSON.parse(JSON.stringify(row))
      let purForm = {}
      purForm.userid = this.user.id;
      purForm.username = this.user.username;
      purForm.type = '购买';
      purForm.price = this.purchaseForm.purchaseprice;
      purForm.name = this.purchaseForm.name;
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
      this.request.post("/rentpurchase", purForm).then(res => {
        if (res.code === '200') {
          this.$message.success("购买成功")
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    rent(row) {
      this.purchaseForm = JSON.parse(JSON.stringify(row))
      let purForm = {}
      purForm.userid = this.user.id;
      purForm.username = this.user.username;
      purForm.type = '租赁';
      purForm.price = this.purchaseForm.rentprice;
      purForm.name = this.purchaseForm.name;
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
      this.request.post("/rentpurchase", purForm).then(res => {
        if (res.code === '200') {
          this.$message.success("租赁成功")
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    del(id) {
      this.request.delete("/yuju/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    shoucang(id) {
      this.request.post("/yuju/shoucang/" + id + "/" + this.user.id).then(res => {
        if (res.code === '200') {
          this.$message.success("收藏成功")
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error("请选择需要删除的数据")
        return
      }
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/yuju/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.minPrice = null
      this.maxPrice = null
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open("http://localhost:9999/yuju/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
