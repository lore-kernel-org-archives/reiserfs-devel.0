From: Anders Widman <andewid@tnonline.net>
Subject: Re: Silly question, defrag
Date: Fri, 5 Apr 2002 08:19:50 +0200
Message-ID: <1051203968.20020405081950@tnonline.net>
References: <20020404105440.F27377@ultraviolet.org>
 <Pine.LNX.4.44.0204041721530.1352-100000@dragon.inside.ntisys.com>
 <20020405053125.GA2724@willow.seitz.com>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020405053125.GA2724@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Vandegrift <ross@willow.seitz.com>
Cc: Benjamin Scott <bscott@ntisys.com>, ReiserFS List <reiserfs-list@namesys.com>


>> I think it would seem likely that, once a filesystem does become fragmented,
>> performance is going to suck mud.

> I'm curious though - shouldn't the elevator read algorithms take care of
> this, for the most part?  If you wait to do a read until you have a few,
> and read sequentially across the disk, you won't be hit with any seeks.

We should not forget that the kernel, or any software might not know
the physical layout of a physical disk medium. Also, if using
different raid, or spanning devices you have a logical layout for all
the blocks.

Read ahead and techniques like that do give lots of speedups, but not
so much for fragmentation.

//Anders


> Of course interactive read performance will suffer, but for general
> streaming reads why doesn't the elevator offset this?

> Ross Vandegrift
> ross@willow.seitz.com

