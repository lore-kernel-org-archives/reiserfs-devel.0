From: Anders Widman <andewid@tnonline.net>
Subject: Re: ReiserFS BUG.
Date: Mon, 22 Apr 2002 18:14:42 +0200
Message-ID: <3617843937.20020422181442@tnonline.net>
References: <1775613750.20020422121757@tnonline.net>
 <200204221242483.SM00415@thebsh.namesys.com>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200204221242483.SM00415@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

> Hi,

> So you ran reiserfsck --rebuild-tree which finished properly, then mounted fs, 
> got kernel oops, and then reiserfsck --fix-fixable aborted. Right?

> Could you provide us metadata of your partition extracted with:

> debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2

> and put it somewhere on ftp. We would like to test reiserfsck and 
> the kernel for such cases.

This is going to take a while (10-12 hours or so). But so far I have
gotten about 30 of these lines:

BROKEN BLOCK HEAD 34531780                      left 158686879, 5568 /sec
BROKEN BLOCK HEAD 34550672                      left 158666522, 5568 /sec

//Anders

