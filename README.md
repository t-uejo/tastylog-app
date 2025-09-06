# Terraform Hanson

## 環境
- Windows11
- Powershell
- AWS

## 前提
- Terraformで使用するIAMユーザ`terraform`を作成すること。
- `aws configure --profile terraform`でプロファイルを作成しておくこと。

## コマンド実行
```
$env:AWS_PROFILE = "terraform"; terraform plan
```