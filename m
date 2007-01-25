From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Reiser4 terribly slow
Date: Thu, 25 Jan 2007 08:57:29 +0800
Message-ID: <6ec7a4340701241657o6e160e33ue221abf3c318a7a5@mail.gmail.com>
References: <6ec7a4340701240605x43297e01xdee68fb7f1d69746@mail.gmail.com>
	 <200701241942.l0OJgFGM021169@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200701241942.l0OJgFGM021169@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>, reiserfs-list@namesys.com, reiserfs-dev@namesys.com

AFAIK, vim fsyncs, azureus fsyncs, and may be many other applications
fsyncs but not only databases.

Definitly turn off fsync() is a bad idea. I just wonder how bad r4's
fsync() performance is.

It seems the result is: "disabled fsync() r4" is even slower than
"enabled fsync() ext3.o"

Is it never be possible to improve that? I found in the mailing-list
that Hans talked it for many years. this must be a CRITICAL
performance flaw for r4.

2007/1/25, Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu>:
> On Wed, 24 Jan 2007 22:05:53 +0800, Xu CanHao said:
> > extremely low performance, i managed to turn off fsync() in
> > fs/reiser4/plugin/file/file.c (nullify the sync_unix_file() function),
>
> (Maybe you understand the following, if so, feel free to ignore.  I'm
> mostly making sure the list archives have this note so anybody else tempted
> to do this will think twice)...
>
> Note that this can be *very* dangerous to the health of your database
> if you implement it blindly without understanding the *full* implications.
>
> Basically, applications almost never call fsync() unless they need it for
> database consistency.  A system crash at an inopportune time *will* totally
> ruin your database.
>
>
>
