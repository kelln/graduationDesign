<template>
  <el-tabs v-model="activeName2" type="card" @tab-click="handleClick">
    <el-tab-pane label="亚洲出行" name="first">
    	<search></search>
    </el-tab-pane>
    <el-tab-pane label="国外出行" name="second">
    	<search></search>
    </el-tab-pane>
    <el-tab-pane label="北方出行" name="third">
		<search></search>
    </el-tab-pane>
    <el-tab-pane label="南方出行" name="fourth">
    	<search></search>
    </el-tab-pane>
  </el-tabs>
</template>

<script>
 	import Search from './Search.vue'


	export default {
		data() {
			return {
				activeName2: 'first'
			}
		},
		methods: {
			handleClick: function() {
				console.log('click');
			}
		},
		components: {
			'search': Search
		}
	}
</script>

<style>
	
</style>