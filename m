From: "James H. Cloos Jr." <cloos@jhcloos.com>
Subject: Re: "Metas"
Date: Fri, 16 Apr 2004 14:11:21 -0400
Message-ID: <m3smf3oks6.fsf@lugabout.jhcloos.org>
References: <20040413180301.77098.qmail@web25010.mail.ukl.yahoo.com>
	<407C2C37.30903@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407C2C37.30903@namesys.com> (Hans Reiser's message of "Tue, 13
 Apr 2004 11:06:47 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Just to add to this, as someone who is eagerly anticipating r4:

While .metas or .meta might be OK, metas or meta is not.

No reserved name should lack an initial dot.

Netapp's .snapshot dir was mentioned in this tread.  That only works
because of the initial dot in the name.  Had it been just snapshot
or snapshots it would not have gone over nearly as well.

I cannot see even those w/o a posix background finding metas any
easier than .metas.

I also suspect you will find it easier to get past Linus.

-JimC
-- 
James H. Cloos, Jr. <cloos@jhcloos.com> <http://jhcloos.com>
