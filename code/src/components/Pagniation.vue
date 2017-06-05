<template>
	<el-pagination
    layout="prev, pager, next"
	:page-size="6"
    :total="totalItem" @current-change="postPageIndex">
  </el-pagination>
</template>

<script>
	export default {
		props: [
			"totalItem"
		],
		created() {
			console.log(this.totalItem);
		},
		methods: {
			postPageIndex: function(index) {
				this.$emit('pag-click', index);
			}
		}
	}
</script>

<style>
	
</style>