From: Oleg Drokin <green@namesys.com>
Subject: Re: Recommended patches for mail server?
Date: Tue, 15 Oct 2002 14:00:54 +0400
Message-ID: <20021015140054.A27555@namesys.com>
References: <20021015094848.0A6E71AEC146@server5.fastmail.fm>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021015094848.0A6E71AEC146@server5.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JP Howard <jh_lists@fastmail.fm>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Tue, Oct 15, 2002 at 09:48:48AM +0000, JP Howard wrote:

> We are running kernel 2.4.19, Cyrus 2.4.9, and Postfix 1.1.11, on dual
> PIII/Athlon servers with RAID 5 arrays. I'm looking for some advice on
> which patches we should be applying to get best performance and
> reliability.

Reiserfs in linux kernel 2.4.19 is pretty reliable already.
Best performance is achieved with data logging patches.

> There's a bunch of patches in
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/ , but only
> 01-06 apply cleanly to 2.4.19. Should we be applying all of these
> patches? If so, what's the trick to getting 07-13 to apply smoothly?

They should apply cleanly, if you are worried about some offsets, this is
ok and should not concern you. (just use -s switch to patch command
to not see unneeded output ;) )

> Then there's Chris Mason's data logging patches. From what I've read, it
> sounds like these should improve both speed and reliability. Are they
> well tested in production environments? Any reason for us not to use

SuSE is including these into their SuSE 8.1 shipped kernels, so I guess
they are tested. Probably Chris can comment more on this.

> Are there any other patches we should be adding? Our first priority is
> ensuring that our servers stay up and that storage is reliable even in
> the case of failure; however obviously performance improvements are nice
> too!

You may need to apply 05-reiserfs_make_bad_inode.diff from 2.4.19.pending
subdir on our FTP, if you are going to use NFS off reiserfs.

Bye,
    Oleg
