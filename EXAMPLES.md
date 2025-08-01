# Block Examples - 单个 Block 渲染的各种例子

本文件提供了 emacs-block 系统中单个 block 渲染的全面示例，涵盖了 block 参数定义的各种格式。

## 概述

block 系统支持以下参数：

- `:content` - 文本内容
- `:width` - 宽度（字符数或像素）
- `:justify` - 文本对齐（left, center, right）
- `:height` - 高度（行数）
- `:align` - 垂直对齐（top, center, bottom）
- `:bgcolor` - 背景色
- `:border` - 边框
- `:margin` - 外边距
- `:padding` - 内边距

## 使用方法

```elisp
;; 加载示例
(require 'block-examples)

;; 查看所有示例
(block-example-render-all)

;; 查看特定类别的示例
(block-example-show-category "basic-content")
```

## 示例分类

### 1. 基本内容示例 (Basic Content Examples)

```elisp
;; 简单文本内容
(block :content "Hello World" :width 15)

;; 多行内容
(block :content "Line 1\nLine 2\nLine 3" :width 20)

;; 带样式的内容
(block :content (propertize "Styled Text" 'face '(:weight bold :foreground "red"))
       :width 15)
```

### 2. 宽度格式示例 (Width Format Examples)

```elisp
;; 字符宽度
(block :content "Fixed width in characters" :width 20)

;; 像素宽度（使用 cons cell）
(block :content "Fixed width in pixels" :width '(400))

;; 中文内容宽度
(block :content "很宽的中文内容测试" :width 15)

;; 窄宽度自动换行
(block :content "This is a long text that will wrap to multiple lines" :width 15)
```

### 3. 文本对齐示例 (Text Justification Examples)

```elisp
;; 左对齐（默认）
(block :content "Left aligned text" :width 20 :justify 'left)

;; 居中对齐
(block :content "Center aligned" :width 20 :justify 'center)

;; 右对齐
(block :content "Right aligned" :width 20 :justify 'right)
```

### 4. 高度和垂直对齐示例 (Height and Vertical Alignment Examples)

```elisp
;; 固定高度，顶部对齐（默认）
(block :content "Top aligned" :width 20 :height 5 :align 'top)

;; 固定高度，居中对齐
(block :content "Center aligned" :width 20 :height 5 :align 'center)

;; 固定高度，底部对齐
(block :content "Bottom aligned" :width 20 :height 5 :align 'bottom)

;; 多行内容对齐
(block :content "Line 1\nLine 2" :width 20 :height 6 :align 'center)
```

### 5. 边框示例 - 基本格式 (Border Examples - Basic Formats)

```elisp
;; 无边框（默认）
(block :content "No border" :width 20 :border nil)

;; 默认边框（所有边）
(block :content "Default border" :width 20 :border t)

;; 自定义颜色边框
(block :content "Red border" :width 20 :border "red")

;; 主题感知边框（亮色/暗色）
(block :content "Theme border" :width 20 :border '("blue" . "cyan"))
```

### 6. 边框示例 - Plist 格式 (Border Examples - Plist Formats)

```elisp
;; 单独边框
(block :content "Left border only" :width 20 
       :border '(:left "red" :right nil :top nil :bottom nil))

;; 上下边框
(block :content "Top/bottom borders" :width 20
       :border '(:top "blue" :bottom "blue"))

;; 混合边框样式
(block :content "Mixed borders" :width 20
       :border '(:left t :right "green" :top nil :bottom "red"))

;; 部分 plist（缺失值默认为 nil）
(block :content "Partial border plist" :width 20
       :border '(:right "purple"))
```

### 7. 背景色示例 (Background Color Examples)

```elisp
;; 无背景（默认）
(block :content "No background" :width 20 :bgcolor nil)

;; 字符串颜色
(block :content "Yellow background" :width 20 :bgcolor "yellow")

;; 主题感知背景
(block :content "Theme background" :width 20 :bgcolor '("lightblue" . "darkblue"))

;; 边框+背景
(block :content "Border + background" :width 20 :border "red" :bgcolor "lightyellow")
```

### 8. 内边距示例 - 基本 (Padding Examples - Basic)

```elisp
;; 无内边距（默认）
(block :content "No padding" :width 20 :border t :padding nil)

;; 默认内边距
(block :content "Default padding" :width 20 :border t :padding t)

;; 自定义内边距 plist
(block :content "Custom padding" :width 20 :border t
       :padding '(:left 2 :right 3 :top 1 :bottom 2))
```

### 9. 内边距示例 - 高级 (Padding Examples - Advanced)

```elisp
;; 大内边距
(block :content "Large padding" :width 20 :border t
       :padding '(:left 4 :right 4 :top 2 :bottom 2))

;; 不对称内边距
(block :content "Asymmetric" :width 20 :border t
       :padding '(:left 0 :right 4 :top 0 :bottom 3))

;; 行高分数内边距
(block :content "Fractional padding" :width 20 :border t
       :padding '(:top 0.5 :bottom 0.3))
```

### 10. 外边距示例 (Margin Examples)

```elisp
;; 无外边距（默认）
(block :content "No margin" :width 20 :border t :margin nil)

;; 默认外边距（零）
(block :content "Default margin" :width 20 :border t :margin t)

;; 自定义外边距 plist
(block :content "Custom margin" :width 20 :border t
       :margin '(:left 3 :right 2 :top 1 :bottom 1))

;; 大外边距
(block :content "Large margins" :width 15 :border t
       :margin '(:left 5 :right 5 :top 2 :bottom 2))
```

### 11. 复杂组合示例 (Complex Combination Examples)

```elisp
;; 完整规格
(block :content "Complete example"
       :width 25
       :height 4
       :justify 'center
       :align 'center
       :border "blue"
       :bgcolor "lightyellow"
       :padding '(:left 2 :right 2 :top 1 :bottom 1)
       :margin '(:left 1 :right 1 :top 1 :bottom 1))

;; 卡片样式布局
(block :content "Card Title\n\nThis is card content with some longer text that demonstrates wrapping."
       :width 30
       :justify 'left
       :border t
       :bgcolor "lightgray"
       :padding t
       :margin '(:bottom 2))

;; 像素精确布局
(block :content "Pixel-precise layout"
       :width '(300)
       :border "gray"
       :bgcolor "white"
       :padding '(:left 2 :right 2 :top 1 :bottom 1))
```

### 12. 边界情况示例 (Edge Case Examples)

```elisp
;; 空内容
(block :content "" :width 10 :border t)

;; 单字符
(block :content "X" :width 20 :justify 'center :border t)

;; 窄宽度中的很宽内容
(block :content "VeryLongWordWithoutSpaces" :width 10 :border t)

;; 最小宽度
(block :content "Min" :width 1)

;; 高度大于内容
(block :content "Small" :width 20 :height 10 :align 'center :border t)

;; 只有部分边框
(block :content "Partial borders" :width 20
       :border '(:top "red" :left "blue"))
```

## 参数格式详解

### 边框格式支持
1. `t` - 所有方向都设置为默认颜色
2. `nil` - 所有方向都不设置边框
3. 颜色字符串 - 所有方向都设置为该颜色
4. cons-cell - `(亮色主题颜色 . 暗色主题颜色)`
5. plist - 单独设置每个方向：`(:left color :right color :top color :bottom color)`

### 背景色格式支持
1. `nil` - 无背景色
2. 颜色字符串 - 指定背景色
3. cons-cell - `(亮色主题颜色 . 暗色主题颜色)`

### 内边距/外边距格式支持
1. `nil` - 无边距
2. `t` - 默认边距
3. plist - 单独设置：`(:left pixels :right pixels :top lines :bottom lines)`

### 宽度格式支持
1. 数字 - 字符数
2. `(数字)` - 像素宽度

## 统计信息

总共提供了 **45** 个示例，分布在 **12** 个类别中，涵盖了所有主要的参数格式和使用场景。