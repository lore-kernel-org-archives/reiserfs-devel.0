From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 mount support, Grub support
Date: Fri, 20 Aug 2004 10:28:19 +0400
Message-ID: <20040820062819.GS5154@backtop.namesys.com>
References: <e7963922040819082125b7d8aa@mail.gmail.com> <20040819203850.GR5154@backtop.namesys.com> <4125989F.1070907@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20419-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4125989F.1070907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Stefan Schweizer <sschweizer@gmail.com>, reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>, Edward Shishkin <edward@namesys.com>

On Thu, Aug 19, 2004 at 11:22:23PM -0700, Hans Reiser wrote:
> Alex Zarochentsev wrote:
> 
> >On Thu, Aug 19, 2004 at 05:21:04PM +0200, Stefan Schweizer wrote:
> > 
> >
> >>Hi,
> >>
> >>is there a patch for util-linux to support reiser4 w/o -t reiser4 in 
> >>mount?
> >>   
> >>
> >
> >add reiser4 to the list in /etc/filesystems ?
> >
> >
> > 
> >
> >>The grub support is not really ready yet.
> >>Symlinks do not work.

under grub?

> >>   
> >>
> Zam, please tell me it is not so....
> 
> >>And if I try to specify the direct path it is accepted.
> >>But when I try to boot it says invalid compress format  :(
> >>   
> >>
> edward?  zam?

Hans, it is not related to the reiser4 comression,

It is error in loading compressed kernel image, means that
the file is corrupted or grub's readfile routine can't read
reiser4 files well.

I think Vitaly couldn't reproduce it.

> >>
> >>Stefan Schweizer
> >>   
> >>

-- 
Alex.
