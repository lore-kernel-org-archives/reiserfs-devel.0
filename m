From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Segfault mounting a reiserfs 3.6 partition
Date: Fri, 20 Oct 2006 21:13:25 +0400
Message-ID: <200610202113.25695.zam@namesys.com>
References: <200610190903.43896.greisberger@zenon-media.com> <200610191830.10675.greisberger@zenon-media.com> <200610201031.11208.greisberger@zenon-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200610201031.11208.greisberger@zenon-media.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, greisberger@zenon-media.net

Hi,

On 20 October 2006 12:29, Christophe Greisberger wrote:
> Yesssssssssss!
>
> I could mount the partition with the latest Gentoo live CD.
> I'll now tar the data and reformat the partition.

likely it was the transaction id overflow bug (fixed in 2.6.17) , the fs 
itself is not broken.

it should work with 2.6.17+, it even may work with the older kernels 
after mount r/w and clean unmount.

> Thanks for your help!
>
> On Thursday, 19 October 2006 18:30, Christophe Greisberger wrote:
> > Hmmm.
> > I'll search for a Live CD with the latest kernel.
> >
> > On Thursday, 19 October 2006 11:45, Edward Shishkin wrote:
> > > Hello.
> > > would you please upgrade your kernel to the latest stable version
> > > (2.6.18) and try to mount again.
> > >
> > > Thanks,
> > > Edward.

-- 
Alex.
