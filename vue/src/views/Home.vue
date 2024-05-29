<template>
  <div style="font-size: 18px;" class="wrapper">
    <div>
      <p style="padding-top: 20px;padding-left:300px;padding-right:300px;">
        <b>企业简介</b><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;钓鱼作为一种休闲运动，在西方享有“水上高尔夫”之称。改造开放以来，随着我国经济的高速增长以及居民休闲娱乐时光的增多，这种休闲活动在国内得到敏捷的发展。以股民、保安、私企老板、退休职员、下岗工人、被征地的农民、其他自由职业者等30多岁以上的男性为主力代表的钓鱼喜好者的强劲购置力为钓具行业的发展带来了勃勃活力。
      </p>
      <p style="padding-top: 100px;padding-left:300px;padding-right:300px;">
        <b>品牌简介</b><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;渔具租赁系统创建于2023年1月，建立了严格的客户档案管理制度和保密制度。秉承“诚信经营，客户至上”的经营理念，致力于为中小微企业及高校科研团队提供精准、安全、规范、保密的专业化一条龙服务。 
      钓鱼作为一种休闲运动，在西方享有“水上高尔夫”之称。改造开放以来，随着我国经济的高速增长以及居民休闲娱乐时光的增多，这种休闲活动在国内得到敏捷的发展。以股民、保安、私企老板、退休职员、下岗工人、被征地的农民、其他自由职业者等30多岁以上的男性为主力代表的钓鱼喜好者的强劲购置力为钓具行业的发展带来了勃勃活力。
      联系我们
      公司地址：
      联系方式：
      电话：18381669804</p>
    
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  }
}
</script>

<style scoped>
.wrapper {
  background: url("../assets/background.jpg");
  width: 80%;
  height: 90%;
  position: fixed;
  background-size: 100% 100%;
}
</style>
