<template>
	<div id="app">
		<!-- <h1>毛里求斯</h1> -->
		<div class="top-content">
			<div class="advise-info">
				<div class="itnation top3">
					<p class="advise-head">国际路线推荐</p>
					<div class="advise-item" v-for="item in outHot" @click="adviseDetial(item)">
						<img class="advise-img" :src="item.imgurl" height="60" width="100" alt="advise">
						<span class="advise-title">{{ item.title | placeNameFilter }}</span>
					</div>
				</div>
				<div class="about top3">
					<p class="advise-head">相关线路推荐</p>
					<div class="advise-item" v-for="aItem in advise" @click="adviseDetial(item)">
						<img class="advise-img" :src="aItem.imgurl" height="60" width="100" alt="advise">
						<span class="advise-title">{{ aItem.title | placeNameFilter }}</span>
					</div>
				</div>
			</div>
			<h2 class="title">{{ currentInfo.title }}</h2>
		</div>	

		<div class="middle-content">

			<div class="main-info">
				<img :src=currentInfo.imgurl height="336" width="469" alt="">
			</div>

			<div class="right-info">

				<div class="grade-group">
					<span>景区等级：</span>
					<span id="grade">{{ currentInfo.grade | gradeFilter }}</span>
				</div>

				<div class="price-min-group">
					<span>最低票价：</span>					
					<span id="price-min">￥{{ currentInfo.priceMin }}</span>
				</div>

				<div class="buy-group">
				    <el-tooltip class="item" effect="dark" content="将会跳转到外部网站购买" placement="top">
				      <el-button type="primary" id="buy" @click.native="buyCurrent">购买</el-button>
				    </el-tooltip>
			    </div>
			
				<div class="address-group">
					<span>地址：</span>
					<span id="address">{{ currentInfo.address }}</span>
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
				<p class="detail-content">{{ currentInfo.detail }}</p>
			</div>
			<div class="commit-group">
				<p class="commit-title">评论区：</p>
				<el-button id="commit-btn" type="success" @click="openMessageBox">我要评论</el-button>
				<div class="commit-item" v-for="(item,index) in evaluate" @mouseover="checkAuthor(index,item)" @mouseout="hideOperation">
					<span class="commit-author">
						{{ item.evaluateUserName }}
					</span>
					<span>:</span>
					<span class="commit-detail">{{ item.content }}</span>
					<span class="operation">
						<span class="eidt" @click="updateEvaluate(item)" :class="{ fade: index == showIndex }">更新</span>
						<span class="delete" @click="deleteEvaluate(item)" :class="{ fade: index == showIndex }">删除</span>
					</span>
				</div>
			</div>
		</div>

	</div>
</template>

<script>
	export default {
		data() {
			return {
				'currentInfo': '',
				'evaluate': [],
				'outHot': [],
				'advise': [],
				'randomNumber': [],
				'operation': false,
				'showIndex': null,
			}
		},
		methods: {
			//leave message
			openMessageBox(id) {	
				console.log(typeof id != 'number')			
				if (sessionStorage.getItem('userName')) {
			        this.$prompt('请输入留言内容', '提示', {
			          confirmButtonText: '确定',
			          cancelButtonText: '取消',
			          inputPattern: /^.*[^\s]+.*$/,
			          inputErrorMessage: '请输入留言内容'
			        }).then(({ value }) => {
			        	var currentUserId = sessionStorage.getItem('userId');
			        	if (typeof id == 'number') {
							var url = 'http://localhost:8088/evaluate/updateEvaluate';
							var para = "userId="+currentUserId+"&evaluateId="+id+"&content="+value;
						} else {
							var url = 'http://localhost:8088/evaluate/addEvaluate.do';
							var para ="userId="+currentUserId+"&scenicRegionId="+this.$route.query.id+"&content="+value;
						}
			        	fetch(url, {
			        		method: 'POST',
			        		headers: {
	                              'Content-Type': 'application/x-www-form-urlencoded',
	                        }, 
	                        mode: 'cros',
	                        body: para,
			        	});

			          this.$message({
			            type: 'success',
			            message: '留言成功'
			          });   
            		  setTimeout(function() {
            		  	location.reload();
            		  },1000)
			        }).catch(() => {
			        	console.log(1)
			          this.$message({
			            type: 'info',
			            message: '取消留言'
			          });       
			        });
		    	} else {
		    		this.$message({
			            type: 'error',
			            message: '请先登录'
			         });
		    	}
     		},
			//select everyarea hotest place
			choseHot: function(data) {
				for (var i = 0; i < data.length -1; i++) {
					for (var j = 0; j < data.length - 1 - i; j++) {
						if (data[j].hotFlag < data[j+1].hotFlag) {
							var temp = data[j];
							data[j] = data[j+1];
							data[j+1] = temp;
						}
					}
				}
				for (var k = 0; k < 3; k++) {
					this.outHot.push(data[k]);
				}
			},
			adviseAbout: function(AreaData) {
				var dataLength = AreaData.length;
				var noEqul = true;
				for (var l = 0; l < 3; l++) {
					var newRandom = Math.ceil(Math.random()*dataLength) - 1;
					this.randomNumber.push(newRandom)
					for (var j = 0; j < l; j++) {
						if (this.randomNumber[j] == newRandom) {
							noEqul = false;
							break;
						} else {
							noEqul = true;
						}
					}

					if (newRandom != this.$route.query.id && noEqul == true) {
						this.advise.push(AreaData[newRandom]);
					} else {
						l--;
					}
				}
			},
			//click advise to show detial
			adviseDetial: function(data) {
				localStorage.setItem('info', JSON.stringify(data));
				this.$router.push('/viewdetial?id=' + data.id);
				location.reload();
			},
			//buy function
			buyCurrent: function() {
				if (this.currentInfo.url != '') {
					window.location = this.currentInfo.url;
				} else {
					this.$message({
			          showClose: true,
			          message: '对不起，当前景点未提供购买链接',
			          type: 'error'
			        });
				}
			},
			//check this evaluate is belong to login user
			checkAuthor: function(index,item) {
				if (sessionStorage.getItem('userId')) {
					var currentLoginUser = sessionStorage.getItem('userId');
					if (currentLoginUser == item.userId) {
						this.showIndex = index;
					}
				} 
			},
			//hide operation
			hideOperation: function() {
				this.showIndex = null;
			},
			//update evaluate
			updateEvaluate: function(data) {
				this.openMessageBox(data.evaluateId);
			},
			//delete evalute 
			deleteEvaluate: function(data) {
				var that = this;
				var para = 'userId=' + data.userId + '&evaluateId=' + data.evaluateId;
				fetch('http://localhost:8088/evaluate/deleteEvaluate', {
                        method: 'POST',
                        headers: {
                              'Content-Type': 'application/x-www-form-urlencoded',
                        }, 
                        mode: "cors",
                        body: para,
                        }).then(function(res) {
                          if (res.ok) {
                            res.json().then(function(data) {
                            	console.log(data)
                                that.$message({
						          showClose: true,
						          message: '删除成功',
						          type: 'success'
						        });
                                location.reload();
                            });
                          } else {
                            console.log("Looks like the response wasn't perfect, got status", res.status);
                          }
                        }, function(e) {
                          console.log("Fetch failed!", e);
                        });
			}
		},		
		created() {
			var that = this;
			this.currentInfo = JSON.parse(localStorage.getItem('info'));
			var currentArea = this.currentInfo.area;
			var currentOutArea = JSON.parse(localStorage.getItem('tourDataOutInfo'));
			this.choseHot(currentOutArea);
			var allAreaInfo = '';
			switch(currentArea) {
				case 1:
					allAreaInfo = JSON.parse(localStorage.getItem('tourDataAroundInfo'));
					break;
				case 2:
					allAreaInfo = JSON.parse(localStorage.getItem('tourDataInInfo'));
					break;
				case 3:
					allAreaInfo = JSON.parse(localStorage.getItem('tourDataOutInfo'));
					break;
				default:
					break;
			}
			this.adviseAbout(allAreaInfo);


			var para = "scenicRegionId="+ this.$route.query.id;
			fetch('http://localhost:8088/evaluate/queryCurrScenicEvaluateList.do',{
				method: 'POST',
		        		headers: {
                              'Content-Type': 'application/x-www-form-urlencoded',
                        }, 
                        mode: 'cros',
                        body: para,
		        	}).then(function(res) {
                          if (res.ok) {
                            res.json().then(function(data) {
                            	that.evaluate = data.list;
                              });
                          } else {
                            console.log("Looks like the response wasn't perfect, got status", res.status);
                          }
                        }, function(e) {
                          console.log("Fetch failed!", e);
                        });
		},
		filters: {
			gradeFilter: function(value) {
				return value = value == '' ? '暂无等级' : value;
			},
			placeNameFilter: function(value) {
				if (value.length >= 4) {
					value = value.substring(0,4);
				}
				return value;
			}
		},

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
		font-size: 20px;
		color: #666;
		font-weight: 300;
		line-height: 32px;
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
	.advise-item {
		cursor: pointer;
	}
	.commit-item {
		position: relative;
	}
	.operation {
		position: absolute;
		top: 20px;
		right: 10px;
	}
	.operation .eidt{
		display: none;
		color: green;
		cursor: pointer;
	}
	.operation .delete{
		display: none;
		color: red;
		cursor: pointer;
	}
	.operation .eidt:hover,
	.operation .delete:hover {
		text-shadow: 0.5px 0.5px blue;
		transition: all 0.5s;
	}
	.operation .fade {
		display: inline;
	}
	@media screen and (max-width:1020px) {
		.advise-info .advise-head {
			margin-right: 3px;
		}
	}
</style>