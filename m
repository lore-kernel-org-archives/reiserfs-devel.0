From: Chris Mason <mason@suse.com>
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: 16 Jan 2003 10:29:03 -0500
Message-ID: <1042730943.31095.2188.camel@tiny.suse.com>
References: <b01ff1$sp0$1@genki.hungrycats.org>
	 <b04o8a$eah$1@satsuki.furryterror.org>
	 <b04o8a$eah$1@satsuki.furryterror.org> <20030116104906.A7078@namesys.com>
	 <b06erb$j34$1@satsuki.furryterror.org>  <20030116182201.A28414@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12398-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116182201.A28414@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Thu, 2003-01-16 at 10:22, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Jan 16, 2003 at 09:16:11AM -0500, Zygo Blaxell wrote:
> > Oleg Drokin  <green@namesys.com> wrote:
> > >Yes, we were able to reproduce the problem and now we are trying to fix it.
> > >Thanks a lot for your help and for the script.
> > Excellent!  :-)
> > Just on a whim, I ran the tests on a different kernel image yesterday
> > and got some different results in the syslog:
> > Jan 15 18:26:00 berkelium kernel: journal-569: flush_commit_list, block already dirty!
> 
> Hm, these are something new for me.
> 

These aren't good at all, either the locking on the commit lists is
broken or the buffer head management is going wrong.

Oleg, do you have any leads or do you want me to try reproducing?

-chris




