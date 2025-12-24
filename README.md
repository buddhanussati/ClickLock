# ClickLock

**ClickLock** is a lightweight AutoHotkey-based utility designed to make text selection easier and more ergonomic. It allows you to toggle the "Hold Left Click" state using your Middle Mouse Button, enabling long highlights without needing to hold down a button.

## 🚀 Features
![clicklock1](https://github.com/user-attachments/assets/92ef1df9-a671-45b1-a861-52be23759f57)

* **Toggle Dragging:** Press **Middle Mouse Button (MButton)** to start a selection.
* **Sticky Highlights:** The selection remains active even if you move the mouse freely.
* **Intuitive Release:** Simply **Left Click** anywhere to "drop" the lock and finalize the highlight without losing your selection.

  
![clicklock2](https://github.com/user-attachments/assets/3aa8655a-806d-4b4e-a5f0-7f89675d391f)

## 🛠️ Installation

1. Download `clicklock.exe` from the [Releases](https://github.com/buddhanussati/Clicklock/releases) section.
2. Run the executable.
3. (Optional) Place a shortcut in your `shell:startup` folder to have it run automatically when Windows starts.

## 📖 How to Use

| Action | Result |
| --- | --- |
| **Middle Click** | Begins "Selection Mode" (Holds Left Click down). |
| **Move Mouse** | Highlight your text as usual. |
| **Left Click** | Finalizes the selection and releases the lock (Highlight stays). |
| **Middle Click (Again)** | Alternatively, press Middle Click again to release the lock. |

## 💻 Technical Details

The script is built using **AutoHotkey v2**. It utilizes a keyboard hook to intercept mouse events, ensuring that the final "Unlock" click doesn't trigger a new cursor placement, which would normally clear your highlighted text.

### Source Code (Snippet)

```autohotkey
; This tool intercepts the LButton Up event to preserve 
$LButton:: {
    if lock {
        lock := false
        Send("{LButton up}")
    } else {
        ; Standard behavior
    }
}

```
