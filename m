From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: Recommended patches for mail server?
Date: Tue, 15 Oct 2002 22:25:13 UT
Message-ID: <20021015222514.05F5F1AEC13E@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Tue, 15 Oct 2002 16:29:23 +0400, "Oleg Drokin"
<green@namesys.com> said:
> On Tue, Oct 15, 2002 at 10:55:21AM +0000, JP Howard wrote:
> > > They should apply cleanly, if you are worried about some offsets,
> > > this is ok and should not concern you. (just use -s switch to patch
> > > command to not see unneeded output ;) )
> > I got quite a few HUNK FAILED. Also, I found that with the data
> > logging patches these other patches didn't apply cleanly.
>
> Hm. You apply the patches in order, is that right?
>
Yes.

> > Could you please tell me which, if any, of these patches are
> > important? Also, I noticed 07-mmaped_data_loss_fix.diff  here:
> > http://www.uwsg.iu.edu/hypermail/linux/kernel/0201.3/1161.html
>
> 07-mmaped_data_loss_fix.diff is in 2.4.19 already, may be you are just
> downloading patches from the wrong dir?
>
I've been searching the archives to see what patches are around. I
noticed this patch and figured it sounded important; it's not related to
my question above about the 2.4.19.pending patches.

> Other patches are some cosmetic cleanups, also new block allocator, but
> this block allocator is uncompatible with Chris' data logging patches
> yet, and you need Chris' patches more. There also this NFS fix I
> recommended and two not very important fixes that you would probably
> never ever need. (fixes are patches 13-remount-rw-fix.diff and
> 04-item_alignment_fix.diff)
>
Well, it sounds like there's nothing for us here to worry about then! If
we ever need NFS, I'll make sure that we apply the patch that you
mentioned.

Thanks again,
  Jeremy
