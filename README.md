# BrakeCODE Alert GitHub Action

GitHub Action to send alerts to BrakeCODE and associated tooling (i.e. NiM).

![NiM Alert](https://blog.june07.com/content/images/2023/01/nimBadgeAnimation.gif)

https://blog.june07.com/brakecode-nim-alert-feature/

## Inputs

## `api-key`
**Required** Your BrakeCODE API Key. Get a free one at https://brakecode.com

## `topic`
Alert topic `"notification"`.

## `title`
**Required** Alert title.

## `content`
Alert content.

## `badge-text`
Sets the badge text for the browser action. The badge is displayed on top of the icon.

## `badge-color`
Sets the background color for the badge.

## Outputs

## `message-id`
The successfully sent message Id.

## Example usage

```
uses: actions/brakecode-alert@v1
with:
  api-key: "${{ secrets.BRAKECODE_API_KEY }}"
  title: "GitHub workflow completed."
  content: "${{ github.repository }}"
  badge-text: "${{ github.repository }}"
  badge-color: "#FF9800"
```

![image](https://user-images.githubusercontent.com/11353590/225995548-f74eecaf-0339-4a1a-a6d5-ed5f36a21d3e.png)
