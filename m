From: Hans Reiser <reiser@namesys.com>
Subject: Re: secure delete?
Date: Mon, 29 Mar 2004 04:59:30 -0800
Message-ID: <40681DB2.3090104@namesys.com>
References: <Pine.LNX.4.44.0403241535580.30246-100000@potato.zayda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17564-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0403241535580.30246-100000@potato.zayda.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Holt <jason@lunkwill.org>
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com

Jason Holt wrote:

>On Wed, 24 Mar 2004, Hans Reiser wrote:
>  
>
>>I  liked Jason's script.  Maybe we should consider putting it in 
>>reiserfsprogs.  Haven't yet looked at Tom's tool.....
>>    
>>
>
>You might have misunderstood the script.  It doesn't do secure delete.  It
>just demonstrates how shred is ineffective on journalling filesystems.
>
>						-J
>
>
>
>  
>
Well, actually now that I think about it, even if your script did what I 
had thought it did, it still wouldn't clear out the journal area if data 
logging was on.

If someone wants to fix this issue, they are welcome to do so and send 
us a patch.  Tom, can you resend your link to me in private email (I 
left it in russia....).

-- 
Hans


