From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: Silly question, defrag
Date: Fri, 5 Apr 2002 00:31:25 -0500
Message-ID: <20020405053125.GA2724@willow.seitz.com>
References: <20020404105440.F27377@ultraviolet.org> <Pine.LNX.4.44.0204041721530.1352-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204041721530.1352-100000@dragon.inside.ntisys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Scott <bscott@ntisys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

> I think it would seem likely that, once a filesystem does become fragmented,
> performance is going to suck mud.

I'm curious though - shouldn't the elevator read algorithms take care of
this, for the most part?  If you wait to do a read until you have a few,
and read sequentially across the disk, you won't be hit with any seeks.

Of course interactive read performance will suffer, but for general
streaming reads why doesn't the elevator offset this?

Ross Vandegrift
ross@willow.seitz.com
