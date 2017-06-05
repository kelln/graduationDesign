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
				fetch('http://localhost:8088/scenic/getAllScenicRegion.do').then(response => response.json())
				.then(data => {
					this.datas = data; 
					console.log(this.datas);
				})
				.catch(e => console.error('error'));
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