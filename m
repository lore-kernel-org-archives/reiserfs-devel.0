From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: journal too big
Date: Wed, 3 Aug 2005 08:23:42 +0400
Message-ID: <200508030823.42529.zam@namesys.com>
References: <4f52331f050802094839f9ad7@mail.gmail.com> <200508022245.00532.zam@namesys.com> <4f52331f05080212161577b5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25294-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4f52331f05080212161577b5f3@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sudo Yang <sudoyang@gmail.com>
Cc: reiserfs-list@namesys.com

On Tuesday 02 August 2005 23:16, sudo Yang wrote:
> This is on the 2.4.20 kernel.

Really? I see your reiserfs crash message contains "2.6.8-1.521smp" string.

Jul 23 09:52:13 csd01a-bld kernel: EIP:    0060:[<f88f8ab2>]    Not tainted
Jul 23 09:52:13 csd01a-bld kernel: EFLAGS: 00010282   (2.6.8-1.521smp)
Jul 23 09:52:13 csd01a-bld kernel: EIP is at reiserfs_panic+0x36/0x56 

The bug exists in both 2.4.x and 2.6.x branches, but the fix isn't backported 
to 2.4.x.

> On 8/2/05, Alexander Zarochentsev <zam@namesys.com> wrote:
> > Hello.
> >
> > On Tuesday 02 August 2005 20:48, sudo Yang wrote:
> > > Some of our systems are getting a kernel panic.  This error is logged
> > > to /var/log/messages:
> > >
> > > Jul 23 09:52:13 csd01a-bld kernel: REISERFS: panic (device sdb1):
> > > journal-1413: journal_mark_dirty: j_len (1024) is too big
> >
> > [ ... ]
> >
> > > We'r eusing ReiserfsFS 3.x.  What does this error mean?  What can we
> > > do about it?
> >
> > Would you please try the attached patch?  it is for 2.6.9 but applies
> > cleanly to 2.6.8.
> >
> > > Thanks

