From: rwhron@earthlink.net
Subject: Re: big reiserfs regression in 2.4.20-pre2
Date: Tue, 20 Aug 2002 23:26:32 -0400
Message-ID: <20020821032632.GA3774@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com

>>>   Is regression going away if you pass this mount option to reiserfs:
>>>      -o alloc=preallocmin=4:preallocsize=9

>> Yes.

> Great, I just found that we forgot to enable preallocation with new block
> allocator by default. This is easily fixable of course.

Is that in the 2.5.patch:
http://marc.theaimsgroup.com/?l=linux-kernel&m=102984193227185&w=2

Or will it be different for 2.4?

-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

