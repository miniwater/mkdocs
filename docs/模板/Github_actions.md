# Github_actions

https://docs.github.com/zh/actions/

每次推送自动打包发布release

```yml
name: release

on: push
permissions:
  contents: write
  discussions: write
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Zip the Build
        run: zip -r xxx_latest ./
      - name: Release
        uses: softprops/action-gh-release@v1
        with:
          tag_name: latest
          name: Release latest
          files: |
            xxx_latest.zip
```
