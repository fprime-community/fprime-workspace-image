# Installing Chrome

1. Add `- webarchitect609.google_chrome       # https://galaxy.ansible.com/webarchitect609/google_chrome` to `requirements.yaml`
1. Add `- role: webarchitect609.google_chrome` to a play's Roles list in `playbook.yaml`
1. Copy `chrome.json` to the image root directory per https://stackoverflow.com/a/64460373
1. Add the following to the `docker-compose.yml` file

```
   # to get Chrome working per https://stackoverflow.com/a/64460373
    security_opt:
      - seccomp=./chrome.json
```