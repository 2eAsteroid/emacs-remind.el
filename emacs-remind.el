;;; emacs-remind.el --- Uses alert-toast and temporary buffers to alert the user. Works on Windows for now.  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Daniel Lin

;; Author:  Daniel Lin <two-e-asteroid@outlook.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Uses alert-toast and temporary buffers to alert the user. Works on Windows for now.

;;; Code:



(provide 'emacs-remind)
(require 'alert-toast)

(defun emacs-remind (reminder parent)
  (with-output-to-temp-buffer "Reminder"
    (princ (format "%s\n" reminder))
    (princ (format-time-string "Sent at: %H:%M\n"))
    (princ (format "Sent by %s\n" parent)))
  (alert-toast-notify `(:title ,parent :message ,reminder :data (:alarm default :long t))))

;;; emacs-remind.el ends here
