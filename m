From: Yury Umanets <umka@namesys.com>
Subject: Re: aal_assert()
Date: Fri, 10 Jan 2003 10:22:43 +0300
Message-ID: <3E1E74C3.8050707@namesys.com>
References: <20021231005440.GA1573@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021231005440.GA1573@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Clausen <clausen@gnu.org>
Cc: reiserfs-list@namesys.com

Andrew Clausen wrote:

>Hi all,
>
>In reiser4progs, aal_assert() has an argument for an assertian
>identifier, so calls look like this:
>
>        aal_assert("umka-889", name != NULL, return NULL);
>
>(Where umka == Yura Umanets :)
>
>Isn't file + line number + version number sufficient to identify
>the spot in the code?  If all of these are printed out in error
>messages, then users' bug reports should give sufficient information
>to trace the problem.
>
>So, I think debug.[ch] should be changed like this:
>
>--- debug.h~	2002-12-29 08:18:42.000000000 +1100
>+++ debug.h	2002-12-29 08:17:38.000000000 +1100
>@@ -20,9 +20,9 @@
> */
> #ifdef __GNUC__
> 
>-#define aal_assert(hint, cond, action)	\
>+#define aal_assert(cond, action)	\
>     do {				\
>-    	if (!__assert(hint, cond,	\
>+    	if (!__assert(cond,		\
> 	   #cond,			\
> 	    __FILE__,			\
> 	    __LINE__,			\
>@@ -30,13 +30,13 @@
> 	{				\
> 	    action;			\
> 	}				\
>-    } while (0);
>+    } while (0)
> 
> #else
> 
>-#define aal_assert(hint, cond, action)	\
>+#define aal_assert(cond, action)	\
>     do {				\
>-	if (!__assert(hint, cond,	\
>+	if (!__assert(cond,		\
> 	    #cond,			\
> 	    "unknown",			\
> 	    0,				\
>@@ -44,17 +44,17 @@
> 	{				\
> 	    action;			\
> 	}				\
>-    } while (0);
>+    } while (0)
> 
> #endif
> 
> #else
> 
>-#define aal_assert(hint, cond, action) while (0) {}
>+#define aal_assert(cond, action) while (0) {}
> 
> #endif
> 
>-extern int __assert(char *hint, int cond, char *text, char *file, 
>+extern int __assert(int cond, char *text, char *file, 
> 		    int line, char *function);
> 
> #endif
>
>--- debug.c~	2002-12-29 08:15:27.000000000 +1100
>+++ debug.c	2002-12-29 08:16:41.000000000 +1100
>@@ -18,7 +18,6 @@
>    aal_assert().
> */
> int __assert(
>-	char *hint,	     /* person owner of assert */
> 	int cond,	     /* condition of assertion */
> 	char *text,	     /* text of the assertion */
> 	char *file,	     /* source file assertion was failed in */
>@@ -34,8 +33,8 @@
> 	   file, line and function assertion was failed in.
> 	*/ 
> 	return (aal_exception_throw(EXCEPTION_BUG, EXCEPTION_IGNORE | EXCEPTION_CANCEL,
>-				    "%s: Assertion (%s) at %s:%d in function %s() failed.",
>-				    hint, text, file, line, function) == EXCEPTION_IGNORE);
>+				    "Assertion (%s) at %s:%d of version %s in function %s() failed.",
>+				    text, file, line, VERSION, function) == EXCEPTION_IGNORE);
> }
> 
> #endif
>
>Cheers,
>Andrew
>
>
>  
>
Actually there was the code earlier like you have proposed. And it was 
changed to the current state due to the following reasons:

* there are two developers working on reiser4progs currentry (Vitaly 
Fertman and Yury Umanets). And our parts is much different. So, each of 
us should work on own code.
* there is not neccessary an assertion is corect and only the author can 
decide is it correct.
* NAMESYS has some development policies. And hints is the one of them.


-- 
Yury Umanets


