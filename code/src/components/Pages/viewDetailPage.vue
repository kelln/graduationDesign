<template>
	<div id="app">
		<!-- <h1>毛里求斯</h1> -->
		<div class="top-content">
			<div class="advise-info">
				<div class="itnation top3">
					<p class="advise-head">国际路线推荐</p>
					<div class="advise-item">
						<img class="advise-img" src="../../../static/resources/img/cq_brage.png" height="60" width="100" alt="advise">
						<span class="advise-title">南京</span>
					</div>
					<div class="advise-item">
						<img class="advise-img" src="../../../static/resources/img/cq_brage.png" height="60" width="100" alt="advise">
						<span class="advise-title">南京</span>
					</div>
					<div class="advise-item">
						<img class="advise-img" src="../../../static/resources/img/cq_brage.png" height="60" width="100" alt="advise">
						<span class="advise-title">南京</span>
					</div>
				</div>
				<div class="about top3">
					<p class="advise-head">猜你想去推荐</p>
					<div class="advise-item">
						<img class="advise-img" src="../../../static/resources/img/cq_brage.png" height="60" width="100" alt="advise">
						<span class="advise-title">南京</span>
					</div>
					<div class="advise-item">
						<img class="advise-img" src="../../../static/resources/img/cq_brage.png" height="60" width="100" alt="advise">
						<span class="advise-title">南京</span>
					</div>
					<div class="advise-item">
						<img class="advise-img" src="../../../static/resources/img/cq_brage.png" height="60" width="100" alt="advise">
						<span class="advise-title">南京</span>
					</div>
				</div>
			</div>
			<h2 class="title">重庆朝天门</h2>
		</div>	

		<div class="middle-content">

			<div class="main-info">
				<img src="../../../static/resources/img/cq_jfb.png" height="336" width="469" alt="">
			</div>

			<div class="right-info">

				<div class="grade-group">
					<span>景区等级：</span>
					<span id="grade">AAAA</span>
				</div>

				<div class="price-min-group">
					<span>最低票价：</span>					
					<span id="price-min">￥110</span>
				</div>

				<div class="buy-group">
				    <el-tooltip class="item" effect="dark" content="将会跳转到外部网站购买" placement="top">
				      <el-button type="primary" id="buy">购买</el-button>
				    </el-tooltip>
			    </div>
			
				<div class="address-group">
					<span>地址：</span>
					<span id="address">北京市景山前街4号</span>
				</div>

				<div class="tag-group">
					<span>标签：</span>
					<span id="tag">
						<el-tag type="warning">美好</el-tag>
						<el-tag type="success">悠闲</el-tag>
						<el-tag>夜景</el-tag>
					</span>
				</div>
			</div>
		</div>

		<div class="bottom-content">
			<div class="referral-group">
				<p class="detail-title">详情：</p>
				<p class="detail-content">朝天门是两江枢纽，也是重庆最大的水码头，自古江面樯帆林立，舟楫穿梭，江边码头密布，人行如蚁。门外沿两边江岸有不少街巷，虽以棚户、吊脚楼居多，可也热闹成市，商业繁盛，门内则街巷棋布，交通四达。所以直到今天，这一带仍是城内最繁华的商业批发零售区。</p>
			</div>
			<div class="commit-group">
				<p class="commit-title">评论区：</p>
				<el-button id="commit-btn" type="success" @click="openMessageBox">我要评论</el-button>
				<div class="commit-item">
					<span class="commit-author">
						Jason Ke
					</span>
					<span>:</span>
					<span class="commit-detail">我很喜欢这个地方赞赞赞Q!!</span>
				</div>
				<div class="commit-item">
					<span class="commit-author">
						Jason Ke
					</span>
					<span>:</span>
					<span class="commit-detail">我很喜欢这个地方赞赞赞Q!!</span>
				</div>
			</div>
		</div>

	</div>
</template>

<script>
	export default {
		methods: {
			openMessageBox() {
		        this.$prompt('请输入留言内容', '提示', {
		          confirmButtonText: '确定',
		          cancelButtonText: '取消',
		          inputPattern: /^.*[^\s]+.*$/,
		          inputErrorMessage: '请输入留言内容'
		        }).then(({ value }) => {
		          this.$message({
		            type: 'success',
		            message: '留言成功'
		          });
		        }).catch(() => {
		          this.$message({
		            type: 'info',
		            message: '取消留言'
		          });       
		        });
     		},
		}
	}
</script>

<style scoped>
	#app {
		width: 80%;
		margin: 0 auto;
		margin-top: 3px;
		padding: 20px 0px;
		background-color: #EEF1F6;
		font-family: "PingFang SC";
	}

	h2.title {
		padding-top: 20px;
		margin-left: 5%;
		color: #333;
		font-weight: 300;
	}

	.middle-content {
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
	}
	.main-info {
		margin-left: 5%;
	}
	.right-info {
		margin-left: 3%;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		font-size: 20px;
		color: #888888;
	}
	.right-info div {
		margin: 20px 10px;
	}
	.grade-group #grade {
		color: #F35050;
		font-weight: 700;
		text-shadow: 1px 1px 1px #7F0938;
	}	
	.buy-group #buy {
		width: 180px;
	}
	.price-min-group #price-min {
		color: #30A913;
		font-weight: 800;
	}
	.address-group #address{ 
		color: #295F3F;
		font-weight: 400;
	}
	.bottom-content {
		width: 90%;
		margin: 0 auto;

	}
	.referral-group .detail-title {
		font-size: 20px;
		color: #A74893;
		font-weight: 500;
		margin-bottom: 0;
	}
	.referral-group .detail-content {
		margin-top: 5px;
		font-size: 16px;
		color: #666;
		font-weight: 300;
		text-indent: 2em;
	}
	.commit-group .commit-item{
		padding: 20px;
		border: 2px solid #E4A84E;
		border-radius: 3px;
		margin: 10px 0;
	}
	.commit-group .commit-item:hover {
		box-shadow: 3px 3px 2px #EDC589;
		transition: 300ms all ;
	}
	.commit-group .commit-title {
		color: #87C728;
		font-size: 20px;
		font-weight: 500;
	}
	.commit-group .commit-author {
		color: #AAAA22;
		font-style: italic;
	}
	.commit-group .commit-detail {
		color: #555511;
		font-weight: 400;
	}
	.commit-group #commit-btn {
		margin-bottom: 10px;
	}
	.advise-info .top3,
	.advise-info  {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	.advise-info .advise-item {
		margin: 2px 5px;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		height: 80px;
		width: 100px;
		border: 1px solid #CE2020;
		text-align: center;
	}
	.advise-item .advise-img {
		border: 0;
		margin-bottom: 1px;
	}
	.advise-item .advise-title {
		padding-top: -10px;
		font-size: 12px;
	}
	.advise-info .advise-head {
		color: #FF1111;
		font-weight: 800;
		margin-right: 10px;
		text-shadow: 0.5px 0.5px #DD0000;
		word-break: break-all;
		font-size: 16px;
		width: 36px;
		letter-spacing: 1px;
	}
	@media screen and (max-width:1020px) {
		.advise-info .advise-head {
			margin-right: 3px;
		}
	}
</style>