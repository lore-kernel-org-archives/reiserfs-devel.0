From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiserfs_fs.h listed in SCO court docs
Date: Wed, 12 Nov 2003 17:43:35 -0700
Message-ID: <20031112174335.B10197@schatzie.adilger.int>
References: <Pine.LNX.4.44.0311122306430.18264-100000@potato.zayda.com> <3FB22652.3020700@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FB22652.3020700@namesys.com>; from reiser@namesys.com on Wed, Nov 12, 2003 at 04:23:46AM -0800
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jason Holt <jason@lunkwill.org>, reiserfs-list@namesys.com

On Nov 12, 2003  04:23 -0800, Hans Reiser wrote:
> Jason Holt wrote:
> >Just looking through the list of supposedly infringing files at groklaw:
> >
> >http://www.groklaw.net/article.php?story=2003111203544653
> >
> >And they list:
> >
> >fs/reiserfs/do_balan.c
> >fs/reiserfs/fix_node.c
> >include/linux/reiserfs_fs.h
> >
> >Hans, did you sneaky look through SCO's IP and use it when writing your code?
>
> Hunh?
> 
> Do they claim that we call some function that infringes (I have no idea 
> what, kmalloc or something....) or that our code in that file itself 
> infringes?  When someone doesn't tell you what is allegedly infringing 
> it is reallly hard to do anything.
> 
> It is really really hard to imagine do_balan.c infringing, as it is not 
> interface code, and nobody else uses trees like we do, and thus it would 
> be harder for it to be contaminated by ext2 code (I am always worrying 
> someone will get lazy and use some ext2 code without my noticing it, and 
> we audit the code before each time we license it to prevent that)  as 
> part of someone conforming to VFS interfaces.....  though I do see some 
> tiny bit of VFS interface code there in do_balan.c....

It appears that the use of "smp" in comments is considered infringing by
SCO.  They should know, they invented SMP, right?

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

