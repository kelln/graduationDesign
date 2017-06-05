<template>
	<div>
  <el-tabs v-model="activeName2" type="card" @tab-click="handleClick">
    <el-tab-pane label="周边游" name="first">
    	<search :areaInfo = "tourDataAroundNew"></search>
    </el-tab-pane>
    <el-tab-pane label="国内游" name="second">
    	<search :areaInfo = "tourDataIn"></search>
    </el-tab-pane>
    <el-tab-pane label="国外游" name="third">
		<search :areaInfo = "tourDataOut"></search>
    </el-tab-pane>
<!--     <el-tab-pane label="南方出行" name="fourth">
    	<search></search>
    </el-tab-pane> -->
  </el-tabs>
  <pagniation :totalItem="totalPage" @pag-click="getPageIndex"></pagniation>
  </div>
</template>

<script>
 	import Search from './Search.vue'
 	import Pagniation from './Pagniation.vue'
 	global.clickTab = 1;

	export default {
		data() {
			return {
				activeName2: 'first',
				tourData: [],
				tourDataAround: [],
				tourDataIn: [],
				tourDataOut:[],
				tourDataAroundNew: [],
				tourDataInNew: [],
				tourDataOutNew:[],
				currentPageIndex: 1,
				totalPage: 1,
			}
		},
		created() {
			var that = this;
			fetch('http://localhost:8088/scenic/getAllScenicRegion.do').then(response => response.json())
				.then(data => {
					console.log(data)
					this.tourData = data; 
					
					for (var item of data) {
						if (item.area == 1) {
							this.tourDataAround.push(item);
						} else if (item.area == 2) {
							this.tourDataIn.push(item)
						} else if (item.area == 3) {
							this.tourDataOut.push(item)
						}
					}
					that.totalPage = this.tourDataAround.length;
					this.pagShow(1, this.tourDataAround, 'a');
					localStorage.setItem('tourDataAroundInfo', JSON.stringify(this.tourDataAround));
					localStorage.setItem('tourDataInInfo', JSON.stringify(this.tourDataIn));
					localStorage.setItem('tourDataOutInfo', JSON.stringify(this.tourDataOut));
				})
				.catch(e => console.error('error'));
		},
		methods: {
			handleClick: function(data) {
				switch (data.index) {
					case "0":
						this.totalPage = this.tourDataAround.length;
						this.pagShow(1, this.tourDataAround, 'a');
						break;
					case "1":
						this.totalPage = this.tourDataIn.length;
						this.pagShow(1, this.tourDataIn, 'b');
						break;
					case "2":
						this.totalPage = this.tourDataOut.length;
						this.pagShow(1, this.tourDataOut, 'c');
						break;
					default:
						this.totalPage = 1;
				}
			},
			//show pagination page
			pagShow: function(index, datas, whichArea) {
				var allItem = datas.length < index * 6 ? datas.length : 6;
				switch(whichArea){
					case 'a':
						this.tourDataAroundNew = [];
						for (var i = 6 * (index-1); i < allItem; i++) {
							this.tourDataAroundNew.push(datas[i]);
						}
						break;
					case 'b':
						this.tourDataInNew = [];
						for (var i = 6 * (index-1); i < allItem; i++) {
							this.tourDataInNew.push(datas[i]);
						}
						break;
					case 'c':
						this.tourDataOutNew = [];
						for (var i = 6 * (index-1); i < allItem; i++) {
							this.tourDataOutNew.push(datas[i]);
						}
						break;
					default:
						break;
				}
				
			},
			//get msg from child
			getPageIndex: function(returnData) {
				this.pagShow(returnData, this.tourDataAround, 'a');
			}
		},
		components: {
			'search': Search,
			'pagniation': Pagniation
		}
	}
</script>

<style>
	.el-tab-pane label {
		font-size: 30px;
	}
</style>