<template>
	<div>
		<div id="app">
			<div class="search">
				<el-input placeholder="你想去哪?"  v-model="search" @keyup.native="key($event)">
					<el-button slot="append" icon="search" @click.native="searchItem"></el-button>
				</el-input>
			</div>
			<div class="card">
				<card :cardInfo = "areaInfo" :totalItem="totalPage"></card>
			</div>
		</div>
	</div>
</template>

<script>
	import Card from './Card.vue'

	export default {
		props: [
			'areaInfo'
		],
		data() {
			return {
				search: '',
				selectResult: '',
				totalPage: 0
			}
		},
		components: {
			'card': Card,
		},
		created() {
			this.totalPage = this.areaInfo.length
		},
		methods: {
			key: function(ev) {
				if (ev.keyCode == 13) {
					this.searchItem();
				}
			},
			searchItem: function() {
				if (this.search != '') {
					console.log(this.areaInfo);
				} else {
					this.$message({
			          showClose: true,
			          message: '请输入搜索内容',
			          type: 'warning'
			        });
				}
			}
		}
	}
</script>

<style scoped>
	.search {
		margin-top: 50px;
	}
	.el-input {
		width: 60%;
	}
</style>