;;                                                      -*- emacs-lisp -*-
(setq
 load-path (cons "/usr/local/src/org-mode/lisp" load-path)
 load-path (cons "/usr/local/src/org-mode/contrib/lisp" load-path)
 load-path (cons "/usr/local/src/org-mode/EXPERIMENTAL" load-path)
 load-path (cons "/mnt/debian/usr/local/src/org-mode/lisp" load-path)
 load-path (cons "/mnt/debian/usr/local/src/org-mode/contrib/lisp" load-path)
 load-path (cons "/mnt/debian/usr/local/src/org-mode/EXPERIMENTAL" load-path)
 org-agenda-files (list "~/doc/work.org"
                        "/opt/dropbox/doc/home.org"))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(require 'org-export)
(require 'org-mw)

;; These two settings make exported HTML look like our Vizrt branded
;; release notes.
(setq org-export-html-preamble "<svg
        id=\"vizrt-logo\"
        version=\"1.1\"
        width=\"138\"
        height=\"84\"
        > 
  <g
          id=\"g12\"
          transform=\"matrix(1.25,0,0,-1.25,-451.34003,425.24315)\"> 
    <g
            id=\"g14\"
            transform=\"matrix(0.0246257,0,0,0.02458666,313.76213,231.21317)\"> 
      <path
              d=\"m 3060.56,3437.2 -209.9,-593.4 -207.05,593.4 -215.82,0 326.08,-866.38 184.92,0 332.24,866.38 -210.47,0\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path16\"/> 
      <path
              d=\"m 3473.3,2569.82 193.547,0 0,866.531 -193.547,0 0,-866.531 z\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path18\"/> 
      <path
              d=\"m 3916.16,3436.36 -0.14,-177.24 364.23,0 -372.91,-554.74 0,-133.56 616.08,0 0,175.25 -374.66,0 366.68,550.78 0,139.51 -599.28,0\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path20\"/> 
      <path
              d=\"m 4961.8,3436.66 c -56.15,0 -99.9,-9.02 -144.01,-53.04 -42.13,-42.13 -63.55,-93.63 -63.55,-153.7 l 0,-658.85 193.26,0 0,629.18 c 0,16.39 5.76,30.04 17.53,41.82 9.79,9.87 32.16,17.44 52.18,17.44 l 161.49,0 0,177.15 -216.9,0\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path22\"/> 
      <path
              d=\"m 5367.91,3699.54 0,-915.91 c 0,-58.68 20.75,-109.43 62.13,-150.8 43.31,-43.47 85.57,-62.01 141.03,-62.01 l 212.69,0 0,174.7 -158.78,0 c -15.96,0 -28.96,5.5 -40.72,16.87 -11.19,11.53 -16.76,24.5 -16.76,40.65 l 0,456.42 216.26,0 0,176.39 -216.26,0 0,263.69 -199.59,0\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path24\"/> 
      <path
              d=\"m 1921.16,3066.86 c -0.39,-514.15 173.24,-988.49 465.56,-1367.51 l 69.26,204.63 c -205.49,300.61 -333.44,658.06 -355.3,1043.68 l -179.52,119.2\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path26\"/> 
      <path
              d=\"m 6404.28,3065.28 c 0.49,513.97 -173.17,988.55 -465.37,1367.26 l -69.46,-204.34 c 205.52,-300.7 333.61,-658.34 355.24,-1043.68 l 179.59,-119.24\"
              style=\"fill:#f57615;fill-opacity:1;fill-rule:evenodd;stroke:none\"
              id=\"path28\"/> 
 
    </g> 
  </g> 
</svg>
"

      org-export-html-postamble t
      org-export-html-postamble-format (quote (("en" "<hr/>
<p class=\"author\">
  Author: %a (%e)
  Date: %d
</p>")))
      org-export-html-style "<style type=\"text/css\">
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: small;
  #width : 600;
  margin: 70px 70px 0px 50px;
}

h1, h2 {
  color: #e88424;
}

h1 {
  font-size: 150%;
}

h2 {
  font-size: 120%;
  margin-top: 3em;
  margin-bottom: 0em;
}

h3, h4, h5, h6 {
  font-weight: bold;
  margin-top: 2em;
  margin-bottom: 0.2em;
}

h3, h4, h5 {
  font-size: 110%;
}

h6 {
  font-size: 80%;
}

a {
  color: #333;
  font-weight: bold;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

p, dl {
  font-size: 95%;
}

p {
  margin-top: 0em;
  margin-bottom: 0.6em;
}

pre.programlisting {
  margin-top: 0em;
  background-color: #ffddaa;
  padding-top: 0.5em;
  padding-bottom: 0.5em;
  padding-left: 0.5em;
  padding-right: 0.5em;
}

em {
  font-weight: bold;
  font-style: normal;
}

em.replaceable {
  font-weight: normal;
  font-style: italic;
}

div.note {
  background-color: #ffddaa;
  padding-top: 0.5em;
  padding-bottom: 0.5em;
  padding-left: 0.5em;
  padding-right: 0.5em;
}
</style>
"
      )

(defun tkj-export-to-confluence()
  (interactive)
  ;; TODO create new file with <filename>.confluence in the same
  ;; directory as the .org file
  (goto-line 1)
  (query-replace "#+BEGIN_SRC js2" "{code}")
  (goto-line 1)
  (query-replace "#+BEGIN_SRC html" "{code}")
  (goto-line 1)
  (query-replace "#+BEGIN_SRC java" "{code}")
  (goto-line 1)
  (query-replace "#+BEGIN_SRC sh" "{code}")
  (goto-line 1)
  (query-replace "#+BEGIN_SRC nxml" "{code}")
  (goto-line 1)
  (query-replace "#+END_SRC" "{code}")
  (goto-line 1)
  (query-replace "#+BEGIN_SRC" "{code}")
  (goto-line 1)
  (query-replace "****" "h4.")
  (goto-line 1)
  (query-replace "***" "h3.")
  (goto-line 1)
  (query-replace "**" "h2.")
  (goto-line 1)
  (query-replace "*" "h1.")
  (goto-line 1)
  (query-replace "
- " "
* ")
  (goto-line 1)
  (query-replace "

| " "
|| ")
  (goto-line 1)
  (query-replace "|
|-" "||
|-")
  )


;; (org-set-generic-type
;;  "confluence" 
;;  '(:file-suffix     ".confluence"
;;                     :body-line-export-preformated t
;;                     :body-line-fixed-format	"%s\n"
;;                     :body-line-fixed-prefix	"{code}\n"
;;                     :body-line-fixed-suffix	"\n\{code}\n"
;;                     :body-line-format "%s\n"
;;                     :body-line-wrap   75
;;                     :body-list-format	"* %s\n"
;;                     :body-list-suffix	"\n"
;;                     :body-number-list-format	"# %s\n"
;;                     :body-number-list-suffix	"\n"
;;                     :body-section-header-format	"%s\n"
;;                     :body-section-header-prefix	("h1. " "h2. " "h3. " "\h4. " "h5. " "h6. ")
;;                     :body-text-prefix	"\n"
;;                     :body-text-suffix	"\n\n"
;;                     :key-binding     ?c
;;                     ))

