# Installing VS Code

1. Add `- gantsign.visual-studio-code         # https://galaxy.ansible.com/gantsign/visual-studio-code` to `requirements.yaml`
1. Copy the contents of `vscode.yaml` into `playbook.yaml`, making sure to preserve order of the VS Code plays
1. Replace `- <insert list of extensions here>` with list of VS Code extensions to install (See [VS Code Extensions Marketplace](https://marketplace.visualstudio.com/vscode) to find extensions and their names)