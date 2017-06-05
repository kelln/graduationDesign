<template>
  <el-tabs v-model="activeName2" type="card" @tab-click="handleClick">
    <el-tab-pane label="周边游" name="first" @click.native="handleClickOne">
    	<search :areaInfo = "tourDataAround"></search>
    </el-tab-pane>
    <el-tab-pane label="国内游" name="second" @click="handleClickTwo">
    	<search :areaInfo = "tourDataIn"></search>
    </el-tab-pane>
    <el-tab-pane label="国外游" name="third" @click.native="handleClickThree">
		<search :areaInfo = "tourDataOut"></search>
    </el-tab-pane>
<!--     <el-tab-pane label="南方出行" name="fourth">
    	<search></search>
    </el-tab-pane> -->
  </el-tabs>
</template>

<script>
 	import Search from './Search.vue'
 	global.clickTab = 1;

	export default {
		data() {
			return {
				activeName2: 'first',
				tourData: [],
				tourDataAround: [],
				tourDataIn: [],
				tourDataOut:[]
			}
		},
		created() {
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
					localStorage.setItem('tourDataAroundInfo', JSON.stringify(this.tourDataAround));
					localStorage.setItem('tourDataInInfo', JSON.stringify(this.tourDataIn));
					localStorage.setItem('tourDataOutInfo', JSON.stringify(this.tourDataOut));
				})
				.catch(e => console.error('error'));
		},
		methods: {
			handleClick: function(index) {
				console.log(index)
			},
			handleClickOne: function() {
				global.clickTab = 1;
			},
			handleClickTwo: function() {
				alert(2)
				global.clickTab = 2;
			},
			handleClickThree: function() {
				alert(3)
				global.clickTab = 3;
			}
		},
		components: {
			'search': Search
		}
	}
</script>

<style>
	.el-tab-pane label {
		font-size: 30px;
	}
</style>