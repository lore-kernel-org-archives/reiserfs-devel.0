From: Hans Reiser <reiser@namesys.com>
Subject: Re: dead inode read from disk... ignore?
Date: Mon, 17 Nov 2003 20:41:02 -0800
Message-ID: <3FB9A2DE.1010108@namesys.com>
References: <3FB20ACD.8080105@dotcom.pl> <16313.57788.693126.214555@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16313.57788.693126.214555@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: myciel <myciel@dotcom.pl>, reiserfs-list@namesys.com

Nikita Danilov wrote:

>myciel writes:
> > Hi
> > 
> > Few times a day I get in syslog:
> > kernel: sd(8,20):vs-13075: reiserfs_read_inode2: dead inode read from 
> > disk [11574064 47212 0x0 SD]. This is likely to be race with knfsd. Ignore
> > 
> > I just wanted to be sure: should I  really ignore this?
>
>Sorry, for delay.
>
>Yes, you should ignore it as it says.
>
> > 
> > kernel: 2.4.22 SMP + data-logging patches + Trond's nfs patches
> > 2 filesystems:  ~800G and  ~450G,
> > filled in ~50% with small files avg size ~36kb
> > 
> > thanks
> > 
> > rafal
> > 
>
>Nikita.
>
>
>  
>
then move this code into REISERFS_DEBUG.....

-- 
Hans


