From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Mon, 24 Feb 2003 21:59:15 +0300
Message-ID: <200302242159.15769.vitaly@namesys.com>
References: <20030220175309.A23616@namesys.com> <b3dluc$n39$1@satsuki.furryterror.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b3dluc$n39$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Monday 24 February 2003 20:49, Zygo Blaxell wrote:
> In article <20030220175309.A23616@namesys.com>,
>
> Oleg Drokin  <green@namesys.com> wrote:
> >   So we solved that with patch below (Zygo, others who think they have
> > this problem, please check).
>
> I am building a kernel with the patch as I type this.  I'll know if it
> works in a few hours.
>
> If it does work, I'll be running reiserfsck for the rest of the week to
> clean out all those dead direntries on all my systems once and for all.
>
> :-P
>
> Reiserfsck takes 53 hours to scan everything on some of my machines,
> which is a long time considering that I already know where all the
> missing direntries are since they are recorded in various error log files.

which version of reiserfsprogs do you use? and is this in the rebuild-tree mode?
if it is, 3.6.5-pre1 had a speedup for pass0. 

> I don't suppose it's a quick or easy task to modify reiserfsck to just fix
> _one_ missing directory entry, or to allow the kernel to unlink missing
> direntries instead of returning EPERM?  Would it suffice to simply hack
> up the unlink() code so that the direntry is removed but the missing
> SD is ignored?

After figuring out what is the exact problem here I can answer if it is easy 
on not. I will respont probably tomorrow morning about it.

P.S. btw, I am going to release a new version of fsck which has some on-boot 
time checks. Is it possible to try it on your big partitions to fugure out 
if it takes less then a few seconds?

-- 

Thanks,
Vitaly Fertman
