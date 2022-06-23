<template>
  <div>
    <button type="button" v-on:click="selectFile()" class="btn btn-white btn-default btn-round">
      <i class="ace-icon fa fa-upload"></i>
      上传头像
    </button>
    <input class="hidden" type="file" v-on:change="uploadFile()" id="file-upload-input">
    <div v-show="teacher.image" class="row">
      <div class="col-md-4">
        <img v-bind:src="teacher.image" class="img-responsive">
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'file',
    props: {
      list: {
        type: Function,
        default: null
      },
      itemCount: Number // 显示的页码数，比如总共有100页，只显示10页，其它用省略号表示
    },
    data: function () {
      return {
      }
    },
    methods: {
      uploadFile () {
        let _this = this;
        let formData = new window.FormData();
        let file = _this.$refs.file.files[0];

        let suffixs = ["jpg", "jpeg", "png"];
        let fileName = file.name;
        let suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length).toLowerCase();
        let validateSuffix = false;
        for (let i = 0; i < suffixs.length; i++) {
          if (suffixs[i].toLowerCase() === suffix) {
            validateSuffix = true;
            break;
          }
        }
        if(!validateSuffix) {
          Toast.warning("文件格式不正确！只支持上传：" + suffixs.join(","));
          return;
        }

        formData.append('file', file);
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER +
            '/file/admin/upload', formData).then((response)=>{
          Loading.hide();
          let resp = response.data;
          let image = resp.content;
          console.log("头像地址：",image);
          _this.teacher.image = image;
        });
      },

      selectFile() {
        $("#file-upload-input").trigger("click");
      }
    }
  }
</script>

<style scoped>
  .pagination {
    vertical-align: middle !important;
    font-size: 16px;
    margin-top: 0;
    margin-bottom: 10px;
  }

  .pagination button {
    margin-right: 5px;
  }

  .btn-primary.active {
    background-color: #2f7bba !important;
    border-color: #27689d !important;
    color: white !important;
    font-weight: 600;
  }

  /*.pagination select {*/
  /*vertical-align: middle !important;*/
  /*font-size: 16px;*/
  /*margin-top: 0;*/
  /*}*/
</style>
