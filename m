From: Oleg Drokin <green@namesys.com>
Subject: Re: Journal-601 error on Redhat 7.3 / reiserfs / ext3 / raid 5
Date: Thu, 3 Jul 2003 10:53:48 +0400
Message-ID: <20030703065348.GD8358@namesys.com>
References: <3F00B119.7080701@cc.hut.fi> <20030701054339.GA7914@namesys.com> <3F035930.9050701@cc.hut.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F035930.9050701@cc.hut.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jussi Vainionp?? <jjvainio@cc.hut.fi>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 03, 2003 at 01:14:08AM +0300, Jussi Vainionp?? wrote:

> >>Apr 27 20:18:06 un kernel: journal-601, buffer write failed
> >I do not know who to blame here. Try to heavily write to loop device 
> >itself (without using
> >reiserfs) to see if something will break? Or bettr yet - upgrade to newer 
> >kernel and see if that's
> >cures your problem?
> I tried the same operation using ext2 instead of reiserfs and at least that 
> worked without any problems.

ext2 does not wait on buffers unless you operate in sync mode, so it won't notice.
Try the ext2 with -o sync then?

Bye,
    Oleg
