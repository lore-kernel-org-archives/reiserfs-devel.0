From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sun, 14 Sep 2003 00:04:57 +0400
Message-ID: <200309140004.57447.vitaly@namesys.com>
References: <20030913063124.GJ2123@backtop.namesys.com> <3F632446.30004@namesys.com> <20030913192123.GA24770@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ph3Y/FR7fE+3wCt"
Return-path: <reiserfs-list-return-15655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030913192123.GA24770@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>
Cc: "Robert P. J. Day" <rpjday@mindspring.com>, Alex Zarochentsev <zam@namesys.com>, Mike Benoit <mikeb@netnation.com>, reiserfs-list@namesys.com

--Boundary-00=_ph3Y/FR7fE+3wCt
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, 

I hope this patch for configure.in will solve the problem.
Try it please and tell us about your results.

On Saturday 13 September 2003 23:21, Oleg Drokin wrote:
> Hello!
>
> On Sat, Sep 13, 2003 at 06:05:58PM +0400, Hans Reiser wrote:
> > >>my system definitely has readline installed, and i get the same error.
> > >
> > >On the other hand, you need not only readline itself, but also its
> > > header files.
> > >Lots of distributions (e.g. redhat-alike) form another package called
> > >(usuaully) readline-devel,
> > >that contains this necessary stuff.
> >
> > did you adjust our headers to be redhat compatible?  If not, please do.
>
> The problem turned out to be that RedHat's readline was compiled with
> ncurses dynamically, so when you link in readline, you need to link ncurses
> too.
>
> Vitaly will release the fix to configure script shortly, I believe.
>
> Bye,
>     Oleg

-- 
Thanks,
Vitaly Fertman
--Boundary-00=_ph3Y/FR7fE+3wCt
Content-Type: text/x-diff;
  charset="koi8-r";
  name="configure_in.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="configure_in.patch"

diff -Nru a/configure.in b/configure.in
--- a/configure.in	Sat Sep 13 23:54:34 2003
+++ b/configure.in	Sat Sep 13 23:54:34 2003
@@ -154,14 +154,14 @@
         with_readline=yes
 )
 
-# Check for termcap
+# Check for ncurses
 if test "x$with_readline" = xyes; then
 	OLD_LIBS="$LIBS"
 	LIBS=""
-	AC_SEARCH_LIBS(tgetent, ncurses curses termcap termlib,
+	AC_SEARCH_LIBS(tgetent, ncurses, 
 		PROGS_LIBS="$PROGS_LIBS $LIBS",
 		AC_MSG_WARN(
-termcap could not be found which is required for the
+ncurses could not be found which is required for the
 --with-readline option (which is enabled by default).
 		)
 		with_readline=no
@@ -177,7 +177,8 @@
 	    AC_MSG_WARN(
 GNU Readline could not be found which is required for the --with-readline
 	    )
-	    with_readline=no
+	    with_readline=no,
+	    -lncurses
     )
     PROGS_LIBS="$PROGS_LIBS $LIBS"
     LIBS="$OLD_LIBS"

--Boundary-00=_ph3Y/FR7fE+3wCt--

