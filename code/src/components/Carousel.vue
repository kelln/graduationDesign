<template>
	<el-carousel :interval="3000" type="card" height="200px">
    <el-carousel-item v-for="item in carouselImg">
      <img :src="item.path" height="360" width="550" :title="item.intro" :alt="item.intro">
    </el-carousel-item>
  </el-carousel>
</template>

<script>
  export default {
    data() {
      return {
        carouselImg: [
          {
            'path': '../../static/resources/img/cq_cq.png',
            'intro': '重庆重庆'
          },
          {
            'path': '../../static/resources/img/cq_hyd.png',
            'intro': '重庆洪崖洞'
          },
          {
            'path': '../../static/resources/img/cq_jfb.png',
            'intro': '重庆解放碑'
          },
          {
            'path': '../../static/resources/img/cq_brage.png',
            'intro': '重庆大桥'
          },
          {
            'path': '../../static/resources/img/cq_sx.png',
            'intro': '重庆小三峡'
          }
        ]
      }
    }
  }
</script>

<style scoped>
  .el-carousel {
    margin-top: 30px;
  }

	.el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
    text-align: center;
  }
  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>