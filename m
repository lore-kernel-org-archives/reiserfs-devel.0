From: Hans Reiser <reiser@namesys.com>
Subject: Re: secure delete?
Date: Wed, 24 Mar 2004 00:40:09 +0300
Message-ID: <4060AEB9.1030200@namesys.com>
References: <Pine.LNX.4.44.0403232055580.26868-100000@potato.zayda.com>
Reply-To: reiser@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17414-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0403232055580.26868-100000@potato.zayda.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Holt <jason@lunkwill.org>
Cc: reiserfs-list@namesys.com

Jason Holt wrote:

>Secure deletion would be a very nice addition to the security features r4 has 
>to offer.  After our discussions on the difficulty of getting things like 
>shred to work with journalling filesystems, I wrote up a demo that I showed at 
>a UUG meeting.  It's here:
>
>http://www.lunkwill.org/tmp/delete/
>
>I get different results every time I run it(!), but usually the last run
>(where we create 6 files) produces lots of text on the "disk" even after
>shredding.  I suspect that reiserfs would behave the same way.
>
>So some way to ask the fs not to leave extra copies of blocks laying around,
>or to securely delete the copies that it makes would be quite useful.
>
>						-J
>
>
>
>  
>
Well, I am not opposed to it, I am just not putting it at the top of my 
funding priorities.;-)

Right now we want to complete our darpa contract feature list and get 
everything debugged....  even if we have already spent all of darpa's 
money....

-- 
Hans

