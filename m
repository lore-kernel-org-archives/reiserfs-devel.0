From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 5 Mar 2003 21:10:55 +0300
Message-ID: <200303052110.55512.vitaly@namesys.com>
References: <200302251650.22469.vitaly@namesys.com> <b43hko$qeg$1@satsuki.furryterror.org> <200303051848.25635.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303051848.25635.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dieter =?utf-8?q?N=C3=BCtzel?= <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com

> Same here with all my "normal" SCSI disks.
> See my former "reiserfsprogs-3.6.5-pre2: volumes do not mount during boot"
> post.
>
> Should I try reiserfsck --rebuild-tree?
>
> Thanks,
> 	Dieter

No, you should run reiserfsck --check manually and follow the instructions.

-- 

Thanks,
Vitaly Fertman
