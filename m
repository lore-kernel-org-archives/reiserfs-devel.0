From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fscking a reiserfs 3.6 filesystem with reiser4progs 0.4.18 segfaults
Date: Mon, 22 Dec 2003 14:54:16 +0300
Message-ID: <200312221452.22263.vitaly@namesys.com>
References: <3FE5A1AA.8040200@libero.it> <3FE6CCDB.2030200@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE6CCDB.2030200@libero.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@libero.it>, reiserfs-list@namesys.com

> now that i look at it, fsck.reiser4 does not even check a reiser4 fs :(

there were too many bugs fixed in reiser4progs last time and we are 
preparing a new snapshot to be released on days.

reiser4progs are supposed to be used with the reiser4 filesystem, 
not reiserfs. For the reiserfs please obtain the reiserfsprogs from:
ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.11.tar.gz

-- 
Thanks,
Vitaly Fertman
