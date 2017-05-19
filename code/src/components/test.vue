<template>
	<div>
		<h1>I am a axios test</h1>
		<el-button @click="axios">click me to send axios request</el-button>
		<div v-for="item in datas">
			<div>{{ item }}</div>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				datas: ''
			}
		},
		methods: {
			axios() {
				this.$ajax({
					methods: 'GET',
					url: 'http://localhost:8088/scenic/getAllScenicRegion.do',
					datatype: 'jaaaa',
					jsonp: 'jsonCallBack',
					success: function(response) {
						this.datas = response;
					},
					error: function(response) {
						console.log(response);
					}
				})
			}
		}
	}
</script>

<style>
	.el-pagination {
		margin: 30px 0 20px 0;
		text-align: center;
	}
</style>