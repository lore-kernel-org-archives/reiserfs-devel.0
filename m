From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Tue, 15 Oct 2002 17:42:16 +0400
Message-ID: <3DAC1B38.40101@namesys.com>
References: <200210121052.22603.bofh@coker.com.au> <200210142252.09438.bofh@coker.com.au> <20021014225812.GA11337@tapu.f00f.org> <200210151457.58520.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <bofh@coker.com.au>
Cc: Chris Wedgwood <cw@f00f.org>, reiserfs-list@namesys.com

Russell Coker wrote:

>See the following graph:
>http://www.coker.com.au/~russell/hardware/46g.png
>
>This shows testing a single 46G drive, two drives on different buses at the 
>same time, and two drives on the same bus at the same time.  zcav (part of 
>Bonnie++) was used to perform the tests.
>
>  
>
>  
>
I am surprised that separating them onto different buses has so little 
effect.  It looks like most of the bottleneck for large reads off two 
drives is not the IDE bus, but something else (maybe CPU or memory 
bandwidth).

Hans


