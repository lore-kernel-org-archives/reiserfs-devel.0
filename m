From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer (purely performance)
Date: Sun, 15 Dec 2002 00:19:35 +0300
Message-ID: <3DFBA067.5040601@namesys.com>
References: <000001c27328$771e5d80$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000001c27328$771e5d80$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darren <teodarren@myrealbox.com>
Cc: 'Russell Coker' <bofh@coker.com.au>, reiserfs-list@namesys.com

darren wrote:

>Hi all,
>
>Thanks for all the very informative bits on this thread.
>
>In my usage, I intend to implement this fileserver to complement another
>server that runs a very intensive small files read/write operation.
>
>These files often run into 200,000 or more but are usually in the range
>of 100kb or less.
>
>Hence, space is not a big issue to me, but performance is. (there's no
>point splitting out the IO from the main server if it runs slower!!).
>
>I will be using an spare server to do this job: Dell Xeon 2GHz with 5 x
>72Gb SCSI hdd (I got on board RAID but have not decided on how to
>configure yet -help here are welcome too!).
>
>My options are: Win2k (NTFS with CIFS), Linux (Reiserfs with Samba) or
>Netapp 870.
>
>What do you guys think?
>
>Thanx again
>Darren
>
>
>
>  
>
Turn off tails if you want good performance for V3.

