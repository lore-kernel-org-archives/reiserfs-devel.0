From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sat, 12 Oct 2002 00:00:43 +0400
Message-ID: <3DA72DEB.4040809@namesys.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <20021010165854.4381ed7e.philippe.gramoulle@mmania.com> <3DA5B971.3040400@namesys.com> <200210112022.27319.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

Russell Coker wrote:

>On Thu, 10 Oct 2002 19:31, Hans Reiser wrote:
>  
>
>>I would say that WAFL is an absolutely superb filesystem for the purpose
>>of RAID NFS fileserving.  Reiser4 may give it some serious competition
>>after some time has passed and we have time for such things as carefully
>>benchmarking NFS, etc., but WAFL is a great filesystem for NFS RAID as
>>it is right now.  That said, mp3.com saved $22 million dollars by using
>>Linux+reiserfs instead of Netapps and Veritas.  They may be good, but
>>reiser3 is cheaper.  A lot cheaper.  Do the math, and you'll buy Linux
>>instead I think.;-)
>>
>>Nobody has done reiser3 vs. WAFL benchmarks.
>>    
>>
>
>One thing that should be stated here is that you can use some of the money you 
>save to buy more powerful hardware.  If ReiserFS is running on drives that 
>have a higher rotational speed and there are more drives in the RAID then it 
>should beat WAFL on most tests regardless of issues of file system 
>efficiency.
>
except that WAFL (at least it was in 1996 when I last benchmarked one) 
is memory bandwidth bound, not disk or CPU bound, when configured with 
14 disk drives.  They do a nice job of zero-copy optimizing from what I 
understand.

So, in a minor correction, instead of buying a WAFL server, you can buy 
3 reiserfs servers, and this may or may not overcome the memory 
bandwidth limitation, but it will certainly do a nicer job with the disk 
space limitation.;-)

I should also mention that actually most of these fileservers are disk 
space bound not performance bound for most of their users, at least that 
was true when I was a sysadmin back in the old days....

Hans

