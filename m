From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Tue, 25 Feb 2003 15:39:10 +0300
Message-ID: <200302251539.10847.vitaly@namesys.com>
References: <20030220175309.A23616@namesys.com> <200302242159.15769.vitaly@namesys.com> <b3eose$crj$1@satsuki.furryterror.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b3eose$crj$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Tuesday 25 February 2003 06:45, Zygo Blaxell wrote:
> In article <200302242159.15769.vitaly@namesys.com>,
>
> Vitaly Fertman  <vitaly@namesys.com> wrote:
> >> Reiserfsck takes 53 hours to scan everything on some of my machines,
> >> which is a long time considering that I already know where all the
> >> missing direntries are since they are recorded in various error log
> >> files.

Ok, I could try to remove them faster, if you give me the list of these 
directories - all those messages in logs, and an account on your computer.

> >which version of reiserfsprogs do you use? and is this in the rebuild-tree
> > mode? if it is, 3.6.5-pre1 had a speedup for pass0.
>
> This is 3.6.5-pre1 in --fix-fixable mode.  600 GB of data, average file
> size 12K.  It currently takes about 8-10 days to dump all of the data to
> tape.

Hm, fix-fixable works faster usually. It would be not bad to get the metadata 
of this partition, and to profile it locally. Although, metadata dump will take 
some time also. If you have this time on one of your mashins, could you run 
debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2

> >P.S. btw, I am going to release a new version of fsck which has some
> > on-boot time checks. Is it possible to try it on your big partitions to
> > fugure out if it takes less then a few seconds?
>
> I could probably fit in a few short tests.

-- 

Thanks,
Vitaly Fertman
