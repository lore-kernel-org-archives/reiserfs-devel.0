From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree segfault
Date: Tue, 2 Jul 2002 15:15:31 +0400
Message-ID: <200207021515.31185.vitaly@namesys.com>
References: <Pine.GSO.4.31.0207020540170.1151-100000@ux5.cso.uiuc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10897-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.GSO.4.31.0207020540170.1151-100000@ux5.cso.uiuc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Savchenko <savchenk@students.uiuc.edu>, reiserfs-list@namesys.com
Cc: savchenk@uiuc.edu


Hi,

It seems to be fixed in last reiserfsprogs. So you can 
try the latest 3.x.1c-pre7 pre-release. If you want to 
know for sure that it will work for you I can test it 
when get your metadata.

> Naturally, reiserfsck --check gives:
>
>   ###########
>   reiserfsck --check started at Tue Jul  2 05:42:40 2002
>   ###########
>   Replaying journal..
>   0 transactions replayed
>   Checking S+tree..
>
>   Bad root block 4294967295. (--rebuild-tree did not complete)
>
>   Aborted
>
>
> A filesystem definitely exists, as shown by debugreiserfs:

This is OK, because we do not want somebody gets his partition 
mounted after rebuild-tree failed.

-- 

Thanks,
Vitaly Fertman


