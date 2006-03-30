From: Hans Reiser <reiser@namesys.com>
Subject: Re: IO randomly blocked for >1 minute while disk writes still in
 2.6.16.1 + 2.6.16-reiser4-1
Date: Thu, 30 Mar 2006 13:13:47 -0800
Message-ID: <442C4A0B.6070607@namesys.com>
References: <20060330023909.GA7547@rvalles.homedns.org.> <442BD204.4030402@namesys.com> <442C32A0.8030200@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442C32A0.8030200@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: reiserfs-list@namesys.com, Edward Shishkin <edward@namesys.com>, vs <vs@thebsh.namesys.com>

Michael Weissenbacher wrote:

>Hi,
>  
>
>>>of the movie. Now, just to know the format, I played it again, and as it
>>>began, it blocked again... not even knoppix is downloading on the
>>>background.
>>>      
>>>
>I just wanted to note that i observed that same bahavior. I tried
>various things, like changing the kernel from preemption to no
>preemtion, trying the various IO-Schedulers and trying 2.6.15, 2.6.16
>and 2.6.16-mm1. In the end i found out that there was a MAJOR
>performance gain by adding the noatime mount option. Before i added that
>I had to wait up to 20 minutes sometimes and now it doesn't stall more
>than a few seconds, but it still does. Seems like reiser4 has very big
>performance problems with the writing of atimes.
>  
>
I think this got fixed in recent versions, vs please comment.  

>Another problem i had was specific to the reiser4-for-2.6.16-1.patch.gz
>patch. I got a kernel crash two times now, but wasn't yet able to log
>the error message anywhere because it would not let me write to the
>reiser4 partition after the error. It never corrupted any data though,
>fsck.reiser4 always reported a consistent fs. I'll try to trigger that
>problem again and make another post.
>  
>

