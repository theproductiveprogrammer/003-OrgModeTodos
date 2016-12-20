;; A Quick Guide to Org-Mode TODO's

;; https://youtu.be/-_e91NhFObU

;; [href=http://orgmode.org/](Org-mode) is one of the
;; crowning jewels of [href=https://www.gnu.org/software/emacs/](EMacs).
;; It is, without doubt, the
;; reigning champion of
;; text-based organizational
;; systems - anything you want
;; to do with text you can do
;; with Org.

;; I've been using Org for a
;; while now and it has
;; constantly amazed me with
;; it's unfolding set of
;; features - Scheduling,
;; prioritizing, unlimited
;; hierarchies, archives,
;; capture inbox items, refile,
;; hyperlinks, tables, markup
;; formatting, exporting,
;; tags... the list looks
;; endless, the implementation
;; is smooth, rock-solid, and
;; phenomenally usable.

;; The fact that Org is not as
;; popularily used is sad. I
;; think there may be two
;; reasons:
;;     1. There are so many
;;     features there is no
;;     obvious place to start.
;;     2. It works best when
;;     you know how to use
;;     EMacs and ELisp.

;; So, in this quick post, I
;; will show you how to start
;; using Org and the basics of
;; using EMacs and ELisp to
;; have a really useful TODO
;; list to manage your day.

;; We will start from scratch,
;; quickly build a workable
;; todo planner system and then
;; I will show you how to
;; customize it by learning
;; some (e)Lisp.

;; Learning Lisp is also really
;; nice for programmers because
;; it is _*so very different*_
;; from our normal Java/C++
;; languages.  Being exposed to
;; different ideas can really
;; help us grow into better
;; (and more productive)
;; programmers.

;; Plus Lisp is _*FUN*_ and easy
;; to get started with. You'll
;; have a blast!

;; *_So let's dive in!_* 

;; First we make sure we've
;; got EMacs installed. It is
;; available for [href=https://emacsformacosx.com/](Mac), [href=https://www.gnu.org/software/emacs/download.html](Windows),
;; and [href=https://www.gnu.org/software/emacs/download.html](Linux). The latest EMacs
;; versions come with Org
;; pre-installed so we should
;; be good to go. (If not,
;; [href=http://orgmode.org/](installing org-mode) is
;; pretty easy).

;; Great. You should now have a
;; screen looking like this:

;;  emacs-startup.png

;; (Notice the tutorial link?
;; It's an excellent start to
;; the basics of using EMacs
;; which you should check out
;; after this post. For now, I
;; will show you what to do so
;; you don't need it).

;; Use:
;;
;;  Control-e:  End of line
;;  Control-a:  Start of line
;;
;;  Control-/:  Undo
;;  Control-G:  Get me out of here
;;              (when stuck)

;; Now you know enough to let
;; you get through this post.
;; After that do read the EMacs
;; tutorial.

;; Because EMacs is an _OOOOLD_
;; editor - it has some funny
;; naming conventions you
;; should know:

;;  emacs-naming.png

;; And we're ready to go!

;; The first principle of
;; productivity is:

;; *_A Blunt Pencil is worth
;; more than a Sharp Mind_*

;;  blunt-pencil.png

;; In other words - _*always use
;; a todo list!*_ To do this,
;; we will create a new Org
;; file and enter our todo
;; items. Start by clicking the
;; first icon on your EMacs
;; toolbar and provide the
;; filename "todo.org". The
;; extension ".org" will tell
;; EMacs that we want to treat
;; this file as an Org file.

;; Next we enter our TODO list.
;; Press Alt-Shift and hit the
;; ENTER key. Voila! A new TODO
;; item!

;;  first-todo.png

;; Add a few more TODO items to
;; practice.

;;  more-todos.gif

;; By now the Alt-Shift-ENTER
;; combo should be giving you an
;; idea of how EMacs works.
;; Almost all EMacs commands are
;; some combination of Control,
;; Alt, and Shift and written in
;; short form like this:
;;
;;  Control-x   :   C-x
;;  Alt-x       :   M-x (Alt = Meta)
;;  Shift-x     :   S-x


;; Now on any TODO line, try
;; <S-right> (Shift and right
;; arrow key). Neat huh? The
;; TODO marker will cycle
;; between:
;;     TODO --> DONE --> <none>

;;  cycle-status.gif

;; At first, these rather odd
;; commands will feel strange
;; but after a short time they
;; feel completely natural and
;; you'll be using them without
;; even thinking.

;; Now let's add some notes to
;; the TODO's. Go to the end of
;; any line (Control-E or C-e)
;; hit <enter> and then the
;; <tab> key. The <tab> key
;; will always bring you to the
;; right indentation level.

;;  todo-notes.png

;; We can also add lists:

;;  add-list.gif

;; <S-right> cycles between
;; different list types.

;;  cycle-lists.gif

;; We can add [href=http://orgmode.org/manual/Hyperlinks.html](hyperlinks),
;; [href=http://orgmode.org/manual/Images-and-tables.html](images), [href=http://orgmode.org/manual/Tables.html](tables), and
;; [href=http://orgmode.org/manual/Markup.html](formatting) to our notes.

;; We can also organize them
;; better. Use
;; M-S-<up,down,left,right> to
;; organize headings.

;;  reorg.gif

;; We can collapse and expand
;; these views at all levels to
;; get a overview and detail by
;; pressing the <tab> and
;; <s-tab> keys

;; As part of our TODO's it is
;; often helpful to list out a
;; checklist of items that need
;; to be completed to
;; accomplish our objective.
;; This is done by using a
;; simple list and adding the
;; `[ ]` text marker.

;;  checkboxes.png

;; These checkboxes can then by
;; toggled using C-c C-c

;;  cycle-checkboxes.gif

;; The last thing we will do is
;; to schedule tasks as that is
;; one really important way to
;; organize our tasks.
;; Scheduling is dead easy -
;;      C-c C-s

;;  schedule.gif

;; Org also comes with a number
;; of detailed reports which
;; you can use. For now,
;; though, let's build our own
;; report and learn some ELisp
;; on the way.

;; First let's figure out what
;; report we want. I'd like a
;; report of all the TODO's
;; due today (and any
;; associated checklists).
;; Also, when we hit ENTER on a
;; report line it should go back
;; to the original todo.

;; This is a simple but very
;; useful report. We can now
;; keep track of multiple
;; projects, keep things on
;; hold (by turning off the
;; TODO), and schedule things
;; to do in the future so they
;; don't show up now.

;;  todo-today-report.png

;; To create this report is
;; actually pretty easy. EMacs
;; is written entirely in a
;; dialect of [href=http://www.gigamonkeys.com/book/introduction-why-lisp.html](LISP) called
;; [href=https://www.gnu.org/software/emacs/manual/eintr.html](ELisp). All the editing,
;; display, window management,
;; and so on are done by
;; executing ELisp. Hence all
;; we have to do is write our
;; own ELisp functions and bind
;; them to some keys to extend
;; EMacs functionality to do
;; anything we want.

;; If you want to try things
;; out as you follow along,
;; open a new ELisp file
;; (end with extension .el) and
;; play around.

;; To understand LISP we ought
;; to start with the origins of
;; the name itself:

;;  LISP-List_Processing.png

;; We only need to understand
;; two things about LISP:
;;     1. Everything important
;;     is a list.
;;     2. Everything is
;;     evaluated.

;;  LISP-lists.png

;; Of course we understand what
;; it means to evaluate simple
;; things like strings and
;; numbers.
;; A number evaluates to
;; itself, strings evaluate to
;; themselves, and so do
;; characters etc:

;;  LISP-evals.png

;; A natural question we can ask
;; is:
;;
;;  How Are Lists Evaluated?
;;
;; The answer is simple:
;;
;; The first element is treated
;; as a function name and the
;; rest of the element are
;; parameters.
;;
;; For example:

;;  call-function.png

;; If any of the parameters are
;; themselves lists, the same
;; applies recursively:

;;  eval-params.png

;; So what happens if we want a
;; list of data such as:
;;     (1 2 3 4)
;; By our logic this will call
;; a function called `1` with
;; parameters `2`, `3`, and `4`
;; which is hardly what we
;; want.
;; What we need is a way to
;; mark expressions we do not
;; want evaluated and we do
;; this by quoting them:
;;     '(1 2 3 4)
;;     'x

;; Example:
;;  (1 2 3 4)   => Error! No function called `1`
;;  '(1 2 3 4)  => '(1 2 3 4)
;;  x           => value of x
;;  'x          => x

;; Now the ELisp for a
;; traditional "Hello World" is

;; (message "Hello World!")

;; Type this in and, just after
;; the ending brace type
;;     C-x C-e
;; which evaluates the
;; expression:

;;  hello-world.gif

;; We can also try

;; (insert "Hello World!")

;;  hello-world2.gif

;; Let's try to make his into a
;; function. The way to do this
;; is to create a list with the
;; first element `defun`
;; ("define function").

;; (defun hw()
;;     (insert "Hello World!"))

;; Now when you execute this
;; expression (C-x C-e) it will
;; simply define a function
;; called "hw". How do we
;; call this function?

;; One way is to create a list
;; with the first element as
;; this function and execute
;; that.

;; However, if we want to be
;; able to call our function
;; from anywhere we should mark
;; it as "interactive".
;;
;; (defun hw()
;;     (interactive)
;;     (insert "Hello World!"))
;;
;; Functions marked as
;; "interactive" can be called
;; by users directly by either
;; linking them to a keypress
;; (we will see this later) or
;; typing `M-x` (Alt-x) and the
;; function name.

;;  interactive-func.gif

;; So now that we know how to
;; create and invoke functions,
;; to create our report all we
;; have to do is create a
;; function that displays the
;; report and invoke it.

;; [=] What we want to do is
;; access the TODO report
;; anytime when we press a key
;; (say F5).
;;
;; [What you need to know]
;;  In EMacs every buffer has a
;;  mapping between a keypress
;;  and a lisp function to be
;;  called. Globally this is
;;  mantained in a variable
;;  called the `global-map`.
;;  A simple way to work with
;;  such "keymaps" is to use the
;;  following function:
(define-key global-map [f5] 'todays_todos)

;;  (This means that whenever the
;;  key F5 is pressed, call the
;;  function `todays_todos`.
;;  As described before, this
;;  function should be marked
;;  "interactive". This allows
;;  us to have many functions
;;  and only make a few
;;  available - something like
;;  an interface to our
;;  functionality).
;;
;;  Let's take a look at how to
;;  write that function next.

;; [=] Show the report
;; [+] Get all the todo's
;; and show them
;; [s] If no todos found or the
;; current buffer is not an
;; org-mode buffer, inform the
;; user.
;;
;; [What you need to know]
;;
;;  * An "if" works as follows:
;;      (if condition
;;          (do when true)
;;       (do when false))
;;
;;  * A "let" defines variables:
;;      (let ((var1 value1)
;;            (var2 value2))
;;          (some-func var1)
;;          (var2 is a function)
;;          (another-func var1 var2)
;;          ...) ;; "let" ends
;;      ;; so var1,var2 no longer available
;;
;; You may find it a little hard
;; to read the following
;; function at first but if you
;; just follow it closely it
;; will become really simple.
;; Trust me (or ping me if you
;; really need help!)
;;
(defun todays_todos()
  (interactive)
  (if (equal major-mode 'org-mode)
      (let ((todos (get_todays_todos)))
        (if todos
            (show_todays_todos todos)
          (user-error "No todo's in current file or org-agenda-files")))
    (user-error "File is not an ORG-MODE file")))

;; [!] Get today's todo's
;; from the current buffer
;; [+] Get all TODO's and
;; filter out those that
;; have a schedule whose
;; date is more than today
;;
;; [What you need to know]
;;
;;      * In order to read from
;;      the buffer, we are going
;;      to move around in this
;;      function. Because we
;;      want to come back to the
;;      same position after the
;;      function we wrap it in a
;;      "save-excursion". This
;;      function saves the
;;      current view and
;;      restores it after
;;      executing all it's
;;      parameters.
;;
;;      * A LISP list is
;;      constructed from nodes
;;      using the function
;;      `cons`. A list node has
;;      two slots - the first
;;      holds the element and
;;      the second holds a
;;      pointer to the next
;;      node. This is best
;;      visualized as follows:

;;  LISP-list-node.png

;;      Therefore we use the
;;      functions (car list) and
;;      (cdr list) to get the
;;      "contained element" and
;;      the "rest of the list"
;;      respectively.
;;
;;      * "Mapping" a list is
;;      the standard way of
;;      iterating over a list
;;      (sort of like a
;;      for-loop). The `mapcar`
;;      list takes a function to
;;      be executed and passes
;;      it the first (the `car`)
;;      element of each list node.

;;  mapcar.png

;;
;;      * "org-entry-properties"
;;      is a function written by
;;      the Org mode authors
;;      that we are simply
;;      reusing to find if an
;;      entry has been
;;      scheduled. Just how did
;;      we find this function?
;;      Well EMacs has an
;;      amazing ability to show
;;      us every function
;;      available! Anything that
;;      EMacs can do - you can
;;      do too!
;;      Explore this by finding
;;      what functions are bound
;;      to your keys:
;;          C-h C-k
;;      And then examining the
;;      function:
;;          C-h C-f
;;
;;      * A "lambda" is simply a
;;      way of naming an
;;      anonymous function. When
;;      you don't want to
;;      `defun` you `lambda` :-)
;;
;; Phew! Lots of weird names
;;   cons, car, cdr, mapcar, and lambda
;; but I hope you got them all.
;;
(defun is_todo_today(todo)
  (save-excursion
    (goto-char (car todo))
    (let* ((props (org-entry-properties nil nil "SCHEDULED"))
           (sch (assoc "SCHEDULED" props)))
      (if (not sch)
          t
        (org-time<= (cdr sch) (format-time-string "%Y-%m-%d 23:59"))))))
(defun get_todays_todos()
  (let (todos)
    (mapcar #'(lambda (todo)
                (if (is_todo_today todo)
                    (setq todos (cons todo todos))))
            (get_todos))
    (reverse todos)))


;; [!] Get all the TODO's
;; from our buffer.
;; [+] Locate todo items and
;; extract them into a list.
;; [ ] Get the todo boundaries
;; from the todo locations
;; [ ] Extract the todo details
;; from these boundaries
(defun get_todos()
  (save-excursion
    (mapcar #'(lambda (x)
                (xtract_todo_from_location (car x) (cdr x)))
            (boundaries (get_todo_locations)))))

;; [=] Return a list of TODO
;; locations
;; [ ] Walk over all org
;; headings and if they have
;; a TODO value (that is not
;; DONE) in their properties,
;; add them to the list.
(defun get_todo_locations()
  (let (pos)
    (ignore-errors
      (org-map-entries
       #'(lambda ()
           (let* ((props (org-entry-properties nil nil "TODO"))
                  (status (assoc "TODO" props)))
             (if (and status
                      (not (equal (cdr status) "DONE")))
                 (setq pos (cons (point) pos))))))
      (reverse pos))))

;; [=] Get todo data from the
;; location
;; [ ] Go to the location
;; [ ] Get the title
;; [ ] Look for checkboxes until
;; next location
;; [ ] Add each checkbox to a
;; list
;; [ ] Return the location,
;; title and checkboxes
;; [s] If there is no title, set
;; it to "TODO". This happens in
;; the case where we just want a
;; 'simple' TODO list:
;;     * TODO
;;       - [ ] Do X
;;       - [ ] Do Y
;;       ...
;;
;; [What you need to know]
;;
;;      * EMacs generally
;;      displays "text" in it's
;;      buffer. But this text is
;;      not just a raw string -
;;      we can have colors,
;;      formatting and so on.
;;      More generally, any text
;;      can have "properties"
;;      that are not displayed
;;      but are associated with
;;      it. Properties like it's
;;      font-face give it the
;;      formatting but we are
;;      free to save any
;;      properties with the
;;      text. We will see this
;;      comes in handy later.
;;      Right now we just use it
;;      to set some formatting
;;      for the title.
;;
(defun xtract_todo_from_location(loc nxt)
  (let (title checkboxes)
    (goto-char loc)
    (setq title (org-get-heading t t))
    (if (not title) (setq title (bold "TODO")))
    (setq title
          (concat
           (make-string (org-outline-level) ?*)
           " " title))
    (while (re-search-forward (org-item-re) nxt t)
      (if (and (org-at-item-checkbox-p)
               (equal "[ ]" (match-string-no-properties 1)))
          (setq checkboxes
                (cons (buffer-substring-no-properties
                       (line-beginning-position)
                       (line-end-position))
                      checkboxes))))
    (cons loc (cons title (reverse checkboxes)))))

;; [!] Return a list of boundaries
;; [+] The list of locations are
;; starting locations:
;;     (l1 l2 l3 l4 ....)
;; which represent the start of
;; each TODO. So what is needed
;; is to add the ending boundary.
;; [+] Now sometimes there are
;; sub-trees that are also marked
;; "TODO". So we end the boundary
;; early at this point.
;; [+..] For example:
;; * TODO1
;; ** TODO2
;; ** TODO3
;; * TODO4
;; ** TODO5
;; ... would result in:
;;     ((l1 l2) (l2 l2.end) (l3 l3.end) (l4 l5)...)
;; [ ] Zip up the list with either
;; the boundary end or the next
;; TODO location.
(defun get_end_boundary(start nxt)
  (if nxt
      (save-excursion
        (goto-char start)
        (org-end-of-subtree t)
        (min nxt (point)))))
(defun boundaries(l)
  (if (car l)
      (let ((start (car l)) (nxt (cadr l)))
        (cons (cons start (get_end_boundary start nxt))
              (boundaries (cdr l))))))

;; [!] We need a nice view of
;; the tasks to be done for the
;; day.
;; [+] Bring up a temporary
;; buffer and show the tasks for
;; the day
;; [+] Show a header and all
;; returned tasks
;; [ ] Open a temporary buffer
;; [ ] Print the header
;; [ ] Print the tasks
;; [ ] Make read-only and
;; [ ] Set keybindings
;;
;; [What you need to know]
;;
;;      * Remember EMacs works
;;      with [href=https://www.gnu.org/software/emacs/manual/html_node/elisp/Buffers.html](buffers) and
;;      windows and frames

;;  emacs-naming.png

;;      What we need is a
;;      temporary buffer for our
;;      report which we "kill"
;;      when we're done with it.
;;
(defun show_todays_todos(todos)
  (switch-to-buffer (set-buffer (get-buffer-create "TODO TODAY")) t t)
  (erase-buffer)
  (show_heading)
  (newline 2)
  (mapcar #'(lambda (todo)
              (let ((s (point)))
                (insert (cadr todo))
                (newline)
                (mapcar #'(lambda(c) (insert c)(newline)) (cddr todo))
                (set_loc (car todo) s (point))))
          todos)
  (goto-char 0)
  (read-only-mode)
  (set-keys))

;; [=] Set keys to make it
;; easier to navigate
;; [+] On 'enter' - goto item
;; [+] On pressing 'q' - quit
;; [ ] Check if we are in 'evil'
;; mode or not and use the
;; appropriate key binding
;; function
;; [ ] Bind 'q' to kill the buffer
;; and go back to (hopefully) the
;; original buffer
;; [ ] Bind 'ENTER' to get the
;; saved location of the todo at
;; the current point and return
;; to it after the buffer is
;; killed.
;; TODO: Viper mode also has
;; it's own keybindings
;; TODO: Save and use filename
;; instead of hoping the buffer
;; we will return to after
;; killing will be correct
;;
;; [What you need to know]
;;
;;      * EMacs has emulation
;;      modes for those (like
;;      me) who are more
;;      comfortable using Vim.
;;      The built-in mode is
;;      called "Viper", but the
;;      most popular is called
;;      "Evil"-mode.
;;      Since Evil-mode changes
;;      the keybindings, we need
;;      to use it's special
;;      functions to set
;;      keybindings instead of
;;      the default EMacs
;;      versions.
;;      Emacs Version:
;;          (local-set-key...)
;;      Evil version:
;;          (evil-local-set-key...)
;;
(defun set-keys()
  (let (set-key)
    (fset 'set-key
          (if (fboundp 'evil-local-set-key)
              #'(lambda (key def)
                  (evil-local-set-key 'normal key def))
            'local-set-key))
    (set-key (kbd "RET") #'(lambda() (interactive)
                             (let ((loc (get_loc)))
                               (kill-buffer nil)
                               (goto-char loc))))
    (set-key (kbd "q") #'(lambda()(interactive)
                           (kill-buffer nil)))))

;; [=] Save and retrive the
;; location of the todo in the
;; text so it can be used to go
;; back to the same location
;; TODO: Also save filename
;;
;; [What you need to know]
;;      * As we discussed above,
;;      we can associate text
;;      displayed in an EMacs
;;      buffer with any
;;      properties we want.
;;      Some of these properties
;;      can be used to format
;;      the text but now we are
;;      using the properties to
;;      store the original
;;      location of the text so
;;      that we can return to it
;;      in our buffer when we
;;      hit 'ENTER' in the
;;      report.
(defun set_loc(loc start end)
  (put-text-property start end 'TODOLOC loc))
(defun get_loc()
  (get-text-property (point) 'TODOLOC))

;; [=] Show the TODO report
;; heading
(defun show_heading()
  (let ((h (format-time-string "%A, %d-%m %Y")))
    (insert "- ")
    (insert (underline h))
    (insert " -")
    (center-line)))

;; [=] Add bold font face
(defun bold(s) (propertize s 'face 'bold))
;; [=] Add underline font face
(defun underline(s) (propertize s 'face 'underline))


;; And we're done! All we need
;; to do to get this report
;; working is to evaluate the
;; functions in this file and
;; press F5 in any org-mode TODO
;; list.

;; An easy way of evaluating all
;; the functions in a file while
;; you are coding is to call an
;; interactive function:
;; `eval-buffer` (M-x eval-buffer)

;; Once you're done, it is best
;; to put your file into your
;; [href=https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html](emacs configuration)
;; (~/.emacs) and load it using
;; the (load-file "do_today.el")
;; function.

;; Have fun playing with EMacs
;; and see you next time!

