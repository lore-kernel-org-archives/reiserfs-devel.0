From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs vs NTFS vs WAFL
Date: Wed, 21 May 2003 22:13:51 +0400
Message-ID: <3ECBC1DF.3060607@namesys.com>
References: <003101c31fa3$3ac20530$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <003101c31fa3$3ac20530$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darren <teodarren@myrealbox.com>
Cc: 'reiserfs' <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>

darren wrote:

>Hi all,
>
>I wonder if there are any papers or benchmarks that compare the
>performance and architectural differences between reiserfs, NTFS and
>WAFL (NetApp's Write Anywhere File Layout)?
>
>Any help will be great.
>
>Regards
>darren
>
>
>
>  
>
I regret to say that all I can do is point you to my LinuxTag paper at 
www.namesys.com/v4/reiser4_the_atomic_filesystem.html, and give you my 
informal opinion that NTFS sucks but has improved a lot, and WAFL is 
great for NFS.

I'd be curious to see mongo numbers on NTFS if anyone has the energy.

Most people comparing WAFL and ReiserFS look at the price per GB and we 
win without the benchmark ever being run.  mp3.com for instance 
sponsored us so that they could save $22 million on Netapps and Suns. 

I would expect WAFL to beat Linux/NFS/ReiserFS V3/RAID because that is 
their niche and they are sharp and I bet their zero copy NFS code is 
better than Linux's, but no one knows for real.  I would be curious to 
see Reiser4 benchmarked against WAFL when we are done, especially if you 
toss in some cards from umem that Mike sells.  ReiserFS might save some 
disk space compared to WAFL.

I would expect NetApp to just blow away any NTFS server.... but I 
haven't measured it.

-- 
Hans


