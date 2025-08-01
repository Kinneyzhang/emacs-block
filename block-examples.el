;; -*- lexical-binding: t -*-
;;; Block Examples - Comprehensive examples covering all block parameter formats
;;
;; This file demonstrates various ways to use the block rendering system,
;; covering all supported parameter formats and combinations.

(require 'block)

;;; Basic Examples

(defun block-example-basic-content ()
  "Basic content examples"
  (list
   ;; Simple text content
   (block :content "Hello World" :width 15)
   
   ;; Multi-line content
   (block :content "Line 1\nLine 2\nLine 3" :width 20)
   
   ;; Content with properties
   (block :content (propertize "Styled Text" 'face '(:weight bold :foreground "red"))
          :width 15)))

(defun block-example-width-formats ()
  "Examples of different width format specifications"
  (list
   ;; Character count width
   (block :content "Fixed width in characters" :width 20)
   
   ;; Pixel width (using cons cell)
   (block :content "Fixed width in pixels" :width '(400))
   
   ;; Wide character width
   (block :content "很宽的中文内容测试" :width 15)
   
   ;; Narrow width with wrapping
   (block :content "This is a long text that will wrap to multiple lines" :width 15)))

(defun block-example-justify-formats ()
  "Examples of text justification options"
  (list
   ;; Left justified (default)
   (block :content "Left aligned text" :width 20 :justify 'left)
   
   ;; Center justified
   (block :content "Center aligned" :width 20 :justify 'center)
   
   ;; Right justified
   (block :content "Right aligned" :width 20 :justify 'right)))

(defun block-example-height-align ()
  "Examples of height and vertical alignment"
  (list
   ;; Fixed height with top alignment (default)
   (block :content "Top aligned" :width 20 :height 5 :align 'top)
   
   ;; Fixed height with center alignment
   (block :content "Center aligned" :width 20 :height 5 :align 'center)
   
   ;; Fixed height with bottom alignment
   (block :content "Bottom aligned" :width 20 :height 5 :align 'bottom)
   
   ;; Multi-line content with alignment
   (block :content "Line 1\nLine 2" :width 20 :height 6 :align 'center)))

;;; Border Examples

(defun block-example-border-basic ()
  "Basic border format examples"
  (list
   ;; No border (default)
   (block :content "No border" :width 20 :border nil)
   
   ;; Default border (all sides)
   (block :content "Default border" :width 20 :border t)
   
   ;; Custom color border
   (block :content "Red border" :width 20 :border "red")
   
   ;; Theme-aware border (light/dark)
   (block :content "Theme border" :width 20 :border '("blue" . "cyan"))))

(defun block-example-border-plist ()
  "Plist border format examples"
  (list
   ;; Individual side borders
   (block :content "Left border only" :width 20 
          :border '(:left "red" :right nil :top nil :bottom nil))
   
   ;; Top and bottom borders
   (block :content "Top/bottom borders" :width 20
          :border '(:top "blue" :bottom "blue"))
   
   ;; Mixed border styles
   (block :content "Mixed borders" :width 20
          :border '(:left t :right "green" :top nil :bottom "red"))
   
   ;; Partial plist (missing values default to nil)
   (block :content "Partial border plist" :width 20
          :border '(:right "purple"))))

;;; Background Color Examples

(defun block-example-bgcolor-formats ()
  "Background color format examples"
  (list
   ;; No background (default)
   (block :content "No background" :width 20 :bgcolor nil)
   
   ;; String color
   (block :content "Yellow background" :width 20 :bgcolor "yellow")
   
   ;; Theme-aware background
   (block :content "Theme background" :width 20 :bgcolor '("lightblue" . "darkblue"))
   
   ;; With border and background
   (block :content "Border + background" :width 20 :border "red" :bgcolor "lightyellow")))

;;; Padding Examples

(defun block-example-padding-basic ()
  "Basic padding format examples"
  (list
   ;; No padding (default)
   (block :content "No padding" :width 20 :border t :padding nil)
   
   ;; Default padding
   (block :content "Default padding" :width 20 :border t :padding t)
   
   ;; Custom padding plist
   (block :content "Custom padding" :width 20 :border t
          :padding '(:left 2 :right 3 :top 1 :bottom 2))))

(defun block-example-padding-advanced ()
  "Advanced padding examples"
  (list
   ;; Large padding
   (block :content "Large padding" :width 20 :border t
          :padding '(:left 4 :right 4 :top 2 :bottom 2))
   
   ;; Asymmetric padding
   (block :content "Asymmetric" :width 20 :border t
          :padding '(:left 0 :right 4 :top 0 :bottom 3))
   
   ;; Fractional padding for line height
   (block :content "Fractional padding" :width 20 :border t
          :padding '(:top 0.5 :bottom 0.3))))

;;; Margin Examples

(defun block-example-margin-formats ()
  "Margin format examples"
  (list
   ;; No margin (default)
   (block :content "No margin" :width 20 :border t :margin nil)
   
   ;; Default margin (zero)
   (block :content "Default margin" :width 20 :border t :margin t)
   
   ;; Custom margin plist
   (block :content "Custom margin" :width 20 :border t
          :margin '(:left 3 :right 2 :top 1 :bottom 1))
   
   ;; Large margins
   (block :content "Large margins" :width 15 :border t
          :margin '(:left 5 :right 5 :top 2 :bottom 2))))

;;; Complex Combination Examples

(defun block-example-combinations ()
  "Complex parameter combination examples"
  (list
   ;; Full specification
   (block :content "Complete example"
          :width 25
          :height 4
          :justify 'center
          :align 'center
          :border "blue"
          :bgcolor "lightyellow"
          :padding '(:left 2 :right 2 :top 1 :bottom 1)
          :margin '(:left 1 :right 1 :top 1 :bottom 1))
   
   ;; Card-like layout
   (block :content "Card Title\n\nThis is card content with some longer text that demonstrates wrapping."
          :width 30
          :justify 'left
          :border t
          :bgcolor "lightgray"
          :padding t
          :margin '(:bottom 2))
   
   ;; Simple pixel-based layout
   (block :content "Pixel-precise layout"
          :width '(300)
          :border "gray"
          :bgcolor "white"
          :padding '(:left 2 :right 2 :top 1 :bottom 1))))

(defun block-example-edge-cases ()
  "Edge case examples"
  (list
   ;; Empty content
   (block :content "" :width 10 :border t)
   
   ;; Single character
   (block :content "X" :width 20 :justify 'center :border t)
   
   ;; Very wide content in narrow width
   (block :content "VeryLongWordWithoutSpaces" :width 10 :border t)
   
   ;; Zero width (minimal)
   (block :content "Min" :width 1)
   
   ;; Height larger than content
   (block :content "Small" :width 20 :height 10 :align 'center :border t)
   
   ;; Only some border sides
   (block :content "Partial borders" :width 20
          :border '(:top "red" :left "blue"))))

;;; Utility Functions for Testing

(defun block-example-render-all ()
  "Render all examples for testing"
  (interactive)
  (let ((examples (append
                   (block-example-basic-content)
                   (block-example-width-formats)
                   (block-example-justify-formats)
                   (block-example-height-align)
                   (block-example-border-basic)
                   (block-example-border-plist)
                   (block-example-bgcolor-formats)
                   (block-example-padding-basic)
                   (block-example-padding-advanced)
                   (block-example-margin-formats)
                   (block-example-combinations)
                   (block-example-edge-cases))))
    (with-current-buffer (get-buffer-create "*Block Examples*")
      (erase-buffer)
      (dolist (example examples)
        (insert (block-render example))
        (insert "\n"))
      (goto-char (point-min))
      (switch-to-buffer (current-buffer)))))

(defun block-example-show-category (category)
  "Show examples for a specific category"
  (interactive
   (list (completing-read "Choose category: "
                         '("basic-content" "width-formats" "justify-formats"
                           "height-align" "border-basic" "border-plist"
                           "bgcolor-formats" "padding-basic" "padding-advanced"
                           "margin-formats" "combinations" "edge-cases"))))
  (let ((examples (funcall (intern (concat "block-example-" category)))))
    (with-current-buffer (get-buffer-create (format "*Block Examples - %s*" category))
      (erase-buffer)
      (insert (format ";; Block Examples - %s\n\n" category))
      (dolist (example examples)
        (insert (block-render example))
        (insert "\n"))
      (goto-char (point-min))
      (switch-to-buffer (current-buffer)))))

(provide 'block-examples)