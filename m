From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: 17 Apr 2003 08:01:09 +0200
Message-ID: <1050559268.13617.22.camel@fortknox>
References: <3E9D83B7.4050904@namesys.com>
	 <1050528366.13617.16.camel@fortknox> <78211964.20030416233820@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <78211964.20030416233820@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>
Cc: Reiserfs-List@namesys.com

On Wed, 2003-04-16 at 23:38, Anders Widman wrote:
> > Yes, I just threw 2 promise controllers away because the drivers are
> > damn instable (at least for kernels 2.4.19- 21pre7).
> 
> > If you don't want to risk unnecessary crashes buy a controller that is
> > *really* supported like the highpointech/cmd/3ware/via ones.
> 
>   Just a note on this. I have found that Promise controllers (at least
>   the  Ultra  100  Tx2  ones)  have  a nasty incapability problem with
>   Maxtor  drives.  This cause me to have all sorts of random problems.
>   Once  I  moved  the  Maxtor  drives to the VIA controller everything
>   runs fine so far.

Well I never had random problems with these controllers (ultra tx2).
They just did crash when I was causing to much io. (raid5 on linux
software raid here, rebuilding the raid and running bonnie at the same
time was enough. all I could do is go down and disable DMA or go to
UDMA0 not sure whether that was enough). 

>   Now I am only running Seagate and IBM on the Promise controllers and
>   it  is  fine. The new Maxtor (which uses Quantum labeled chips) seem
>   to work good too.

they crash at least with maxtor and wdc drives. no no it is the
controller this time.

Soeren.

