From: Hans Reiser <reiser@namesys.com>
Subject: Re: secure delete?
Date: Wed, 24 Mar 2004 10:54:02 +0300
Message-ID: <40613E9A.9090605@namesys.com>
References: <Pine.LNX.4.44.0403240625080.18021-100000@potato.zayda.com>
Reply-To: reiser@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0403240625080.18021-100000@potato.zayda.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Holt <jason@lunkwill.org>
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com, vs@thebsh.namesys.com

Jason Holt wrote:

>On Tue, 23 Mar 2004, Tom Vier wrote:
>  
>
>>btw, i wrote a file wiper which does blk and char devs, and regular files.
>>shameless plug:
>>    
>>
>
>I'm curious whether it would work better than shred with the script I posted
>earlier.  Would you mind trying it?  How's about with reiserfs?
>
>						-J
>
>
>
>  
>
Oh but wait, I forgot, I think we have some reserved space that Jason's 
shred won't reach.  Vladimir, is that still true?

-- 
Hans

