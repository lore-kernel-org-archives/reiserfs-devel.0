From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.4.19-pre7 / corruption on unwanted reboot
Date: Sun, 5 May 2002 12:09:03 +0400
Message-ID: <20020505120903.A11812@namesys.com>
References: <20020504211147.GA20092@matrix.wg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020504211147.GA20092@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Mueller <dmuell@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, May 04, 2002 at 11:11:47PM +0200, Dirk Mueller wrote:

> I've seen HEAVY file corruption on unwanted reboots (like pressing the reset 
> button accidently) on reiserfs with this kernel on 3 machines now. 

This is bad. Does any earlier (but still relatively recent) kernel excibits
this same behavior?

> The symptom is that it finds a LOT of files to "unlink" on journal replay, 
> which I find suspicious as those machines are lightly loaded. 

How much is this "a LOT"? I think that even 10+ files that are unlinked
after the unclean reboot/crash is pretty normal. Programs tend to use
deleted files after the deletion, so this number highly depends
on kind of programs you usually run.

> I didn't follow the development too closely the last few weeks, but I 
> believe that something turned worse in this respect lately. 

In fact nothing unexpected went into 2.4.19-pre7, that was not available in
our pending patches directory on our ftp site.

> Note that reiserfsck doesn't find any error in the file system structure 
> before and after the journal replay on reboot, 
> still many files (especially those that were not touched for several hours 
> before the reboot) contain complete garbage after the journal replay. 

I sthere any other pattern for damaged files besides these were not touched for
several hours prior to reboot?
Do their mtimes confirm they were modified long ago?

Thanks for the report.

Bye,
    Oleg
