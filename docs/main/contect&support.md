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

# 委员会成员

<div style="text-align: center;">
    <div style="display: inline-block; text-align: left; margin: 10px;">
        <img src="tianxingchen.jpg" alt="Tianxing Chen" width="150" />
        <div><strong>陈天行 Tianxing Chen</strong><div style="font-size: small">(2025届计软->HKU PhD)</div></div>
    </div>
    <div style="display: inline-block; text-align: left; margin: 10px;">
        <img src="tianxingchen.jpg" alt="Tianxing Chen" width="150" />
        <div><strong>关浩林 Haolin Guan</strong><div style="font-size: small">(2026届计软->Karma实习)</div></div>
    </div>
    <!-- 可以添加更多的成员 -->
</div>