From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: reiserfs_fs.h listed in SCO court docs
Date: Thu, 13 Nov 2003 01:43:12 +0100
Message-ID: <20031113004312.GA17130@hello-penguin.com>
References: <Pine.LNX.4.44.0311122306430.18264-100000@potato.zayda.com> <3FB22652.3020700@namesys.com>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FB22652.3020700@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jason Holt <jason@lunkwill.org>, reiserfs-list@namesys.com

On Wed, Nov 12, 2003 at 04:23:46AM -0800, Hans Reiser wrote:

> >http://www.groklaw.net/article.php?story=2003111203544653
> >
> >And they list:
> >
> >fs/reiserfs/do_balan.c
> >fs/reiserfs/fix_node.c
> >include/linux/reiserfs_fs.h
> >
> >Hans, did you sneaky look through SCO's IP and use it when writing your 
> >code?

> Hunh?
> 
> Do they claim that we call some function that infringes (I have no idea 
> what, kmalloc or something....) or that our code in that file itself 
> infringes?  When someone doesn't tell you what is allegedly infringing 
> it is reallly hard to do anything.

asp:~/linux/fs/reiserfs# grep \ SMP *.c
do_balan.c:   using buffers already obtained.  For SMP support it will someday be
fix_node.c: * When ported to SMP kernels, only at the last moment after all needed nodes
asp:~/linux/fs/reiserfs# 


SCO really sucks.
There was simply no real investigation.

-- 

  ciao - 
    Stefan
