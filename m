From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: Recommended patches for mail server?
Date: Tue, 15 Oct 2002 10:55:21 UT
Message-ID: <20021015105521.71AE11AEC14C@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Tue, 15 Oct 2002 14:00:54 +0400, "Oleg Drokin" <green@namesys.com>
said:
> Hello!
> 
Hi Oleg! Many thanks for your reply.

> > There's a bunch of patches in
> > ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/ , but only
> > 01-06 apply cleanly to 2.4.19. Should we be applying all of these
> > patches? If so, what's the trick to getting 07-13 to apply smoothly?
> 
> They should apply cleanly, if you are worried about some offsets, this is
> ok and should not concern you. (just use -s switch to patch command
> to not see unneeded output ;) )
> 
I got quite a few HUNK FAILED. Also, I found that with the data logging
patches these other patches didn't apply cleanly.

Could you please tell me which, if any, of these patches are important?
Also, I noticed 07-mmaped_data_loss_fix.diff  here:
http://www.uwsg.iu.edu/hypermail/linux/kernel/0201.3/1161.html

Since Cyrus mmap()s files which it also opens directly, is this an
important patch? Any others of these 2.5 patches? Are they backported to
2.4?

> SuSE is including these into their SuSE 8.1 shipped kernels, so I guess
> they are tested. Probably Chris can comment more on this.
> 
That's a pretty good indicator!

> You may need to apply 05-reiserfs_make_bad_inode.diff from 2.4.19.pending
> subdir on our FTP, if you are going to use NFS off reiserfs.
> 
We don't use NFS.
