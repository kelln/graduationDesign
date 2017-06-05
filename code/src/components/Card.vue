<template>
	<el-row class="show-imgcard">
		<el-col :span="7" v-for="(item, index) in cardInfo" :offset="0">
			<el-card :body-style="{ padding: '0px' }" @click.native="viewDetail(item)">
				<img :src="item.imgurl" height="300" width="800" class="image" alt="img">
				<div style="padding: 14px;">
					<h3 class="title">{{ item.title }}</h3>
          <span class="info">{{ item.address }}</span>
					<!-- <div class="bottom clearfix">
						<time class="time">{{ currentDate }}</time>
						<el-button type="text" class="button" @click="clicked">操作按钮</el-button>
					</div> -->
				</div>
			</el-card>
		</el-col>
	</el-row>
</template>

<script>
  // global.currentDetail = '';
	export default {
    props: [
      'cardInfo'
    ],
		data() {
			return {
				currentDate: new Date().toLocaleDateString()
			}
		},
    methods: {
      viewDetail(currentItem) {
        localStorage.setItem('info', JSON.stringify(currentItem));
        this.$router.push('/viewdetial?id=' + currentItem.id);
      }
    },
    created() {
      console.log(this.cardInfo);
    }
	}
</script>

<style>
	.time {
    font-size: 13px;
    color: #999;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 100%;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }

  .show-imgcard .el-col {
    margin-top: 50px;
  }

  .el-row {
    /*margin-left: 5%;*/
  }

  .el-col {
    margin-left: 3.3%;
  }

  .show-imgcard .title {
    margin-top: 3px;
    margin-bottom: 10px;
  }

  .el-card {
    cursor: pointer;
  }

  .show-imgcard .info {
    height: 24px;
    word-break: break-all;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical; 
    -webkit-line-clamp: 1; 
    overflow: hidden;
  }
</style>