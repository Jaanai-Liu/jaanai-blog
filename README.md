# Jaanai's Blog

基于 [AstroPaper](https://github.com/satnaing/astro-paper) 主题的个人博客，部署在 [114132.xyz](https://114132.xyz)。

## 开发

```bash
cd ~/projects/jaanai-blog
devenv shell    # 或 nix shell nixpkgs#nodejs_22 nixpkgs#pnpm
pnpm install
pnpm dev        # 本地预览 http://localhost:4321
```

## 添加帖子

在 `src/data/blog/` 下创建 `.md` 文件，格式参考已有帖子。提交后部署即可。

## 构建 & 部署

博客作为 Nix flake 被 [nix-config](https://github.com/Jaanai-Liu/nix-config) 引用，`colmena apply` 时自动编译部署。

本地单独构建：

```bash
nix build
```
