From: Yury Umanets <umka@namesys.com>
Subject: Re: Autoconf error
Date: Tue, 29 Jul 2003 09:07:01 +0400
Message-ID: <1059455220.7235.13.camel@haron.namesys.com>
References: <3F255543.8010409@mrs.umn.edu>  <3F255920.3070804@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15100-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F255920.3070804@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

On Mon, 2003-07-28 at 21:10, Grant Miner wrote:
> $ ./prepare
> 
> > Running aclocal...
> > Running autoheader...
> > Running autoconf...
> > configure.in:44: error: possibly undefined macro: dnl
> >      If this token and others are legitimate, please use 
> > m4_pattern_allow.
> >      See the Autoconf documentation.
> > configure.in:48: error: possibly undefined macro: AC_CHECK_LIB
> > configure.in:49: error: possibly undefined macro: AC_MSG_ERROR
> > configure.in:54: error: possibly undefined macro: AC_CHECK_HEADER
> > configure.in:58: error: possibly undefined macro: AC_MSG_CHECKING
> > configure.in:60: error: possibly undefined macro: AC_TRY_LINK_FUNC
> > configure.in:61: error: possibly undefined macro: AC_MSG_RESULT
> > configure.in:73: error: possibly undefined macro: AC_TRY_RUN
> >
> >
> This first happens with version 1.136 of configure.in

I have put reiser4progs and libaal to
http://www.namesys.com/snapshots/2003.07.29

Use it please.

-- 
We're flying high, we're watching the world passes by...

