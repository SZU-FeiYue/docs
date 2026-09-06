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

本地发布（需对本仓库和 github.io 都有写权限）：

```bash
./scripts/sync-github-io.sh
```

只构建并提交、不推送：`./scripts/sync-github-io.sh --no-push`。先看将要覆盖哪些文件：`./scripts/sync-github-io.sh --dry-run`。

`main` 推送后，GitHub Actions 会跑同一套脚本。先在本仓库 Settings → Secrets 里加上 `PAGES_DEPLOY_TOKEN`：一把对 `SZU-FeiYue/SZU-FeiYue.github.io` 有 Contents 写权限的 PAT。
