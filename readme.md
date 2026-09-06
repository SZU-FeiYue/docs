# 深圳大学飞跃手册

持续更新中。线上阅读：<https://szu-feiyue.github.io>

## 本地预览

```bash
pip install -r requirements.txt
mkdocs serve
```

浏览器打开 <http://127.0.0.1:8000>。修改 `docs/` 或 `mkdocs.yml` 后页面会自动刷新。

## 发布到 szu-feiyue.github.io

源码在本仓库，线上站点是组织主页仓库 [SZU-FeiYue.github.io](https://github.com/SZU-FeiYue/SZU-FeiYue.github.io)。`mkdocs build` 生成的 `site/` 需要同步过去，GitHub Pages 才会更新。

用本机 SSH 推到两个仓库即可，不需要 PAT：

```bash
./scripts/sync-github-io.sh
```

脚本默认 `git@github.com:SZU-FeiYue/SZU-FeiYue.github.io.git`。只提交不推送：`--no-push`。先看将覆盖哪些文件：`--dry-run`。
