<template>
	<div>
		<el-select slot="append" v-model="selectResult" placeholder="请选择">
			<el-option label="旅游" value="1"></el-option>
			<el-option label="出行" value="2"></el-option>
			<el-option label="住宿" value="3"></el-option>
		</el-select>
		<el-input placeholder="你想去哪?"  v-model="search">
			<el-button slot="append" icon="search"></el-button>
		</el-input></div>
</template>

<script>
	export default {
		data() {
			return {
				search: '',
				selectResult: ''
			}
		}
	}
</script>

<style scoped>
	.el-input {
		width: 60%;
	}
</style>