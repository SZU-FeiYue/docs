---
comments: true
---

<style>
* {
  box-sizing: border-box;
}
body {
  font-family: Arial, Helvetica, sans-serif;
}
hr.narrow {margin: 0 10px}
/* 并排浮动两列 */
.column {
  float: left;
  width: 50%;
  padding: 0 5px;
}
.fullcolumn {
  float: left;
  width: 100%;
  padding: 0 5px;
}


/* 删除多余的左右边距，由于填充 */
.row {margin: 0 10px; margin-bottom: 20px;}

/* 清除列后的浮点数 */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* 响应列 */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* 设置计数器卡片的样式 */
.card {
  box-shadow: 0 0px 3px 0 rgba(128, 128, 128, 0.2);
  padding: 10px;
  transition: 0.3s;
  /* text-align: center; */
  /* background-color: #ffffff; */
  border-radius: 2px;
}
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(128, 128, 128, 0.2);
}
.container {
  padding: 5px 5px;
}
</style>

# 深圳大学飞跃手册编写委员会

## 委员会成员

<!-- <div style="text-align: center;">
    <div style="display: inline-block; text-align: left; margin: 10px;">
        <img src="../files/tianxingchen.jpg" alt="Tianxing Chen" width="150" />
        <div><strong>陈天行 Tianxing Chen</strong><div style="font-size: small">2025届计软</div></div>
    </div>
    <div style="display: inline-block; text-align: left; margin: 10px;">
        <img src="../files/tianxingchen.jpg" alt="Tianxing Chen" width="150" />
        <div><strong>关浩林 Haolin Guan</strong><div style="font-size: small">2026届计软</div></div>
    </div>
    <div style="display: inline-block; text-align: left; margin: 10px;">
        <img src="../files/xiaogangpeng.png" alt="Tianxing Chen" width="150" />
        <div><strong>彭小刚 Xiaogang Peng</strong><div style="font-size: small">深圳大学副教授</div></div>
    </div>
</div> -->
* **陈天行**，2025届计软本科生 (创始人)
* **关浩林**，2026届计软本科生
* **彭小刚**，深圳大学副教授

## 联系与支持
负责人邮箱: <a href="mailto:chentianxing2002@gmail.com">chentianxing2002@gmail.com</a><br>
负责人微信: **TianxingChen_2002**

## 声明
本手册使用 Material for Mkdocs 构建，在 GitHub 上开源，使用 GitHub Pages 公开发布。

手册内容由 [深圳大学飞跃手册编写委员会](./main/contect%26support.md) 收集、编写、审核、发布并维护。内容仅供参考，且不代表任何政治立场。手册所有内容依据[CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/)授权，不得做商业用途，转载或者引用请注明来源。

对于不遵守此声明或者其他违法使用本文内容者，依法保留追究权等。
