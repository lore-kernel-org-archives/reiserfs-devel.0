From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs_fs.h listed in SCO court docs
Date: Wed, 12 Nov 2003 04:23:46 -0800
Message-ID: <3FB22652.3020700@namesys.com>
References: <Pine.LNX.4.44.0311122306430.18264-100000@potato.zayda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0311122306430.18264-100000@potato.zayda.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Holt <jason@lunkwill.org>
Cc: reiserfs-list@namesys.com

Jason Holt wrote:

>Just looking through the list of supposedly infringing files at groklaw:
>
>http://www.groklaw.net/article.php?story=2003111203544653
>
>And they list:
>
>fs/reiserfs/do_balan.c
>fs/reiserfs/fix_node.c
>include/linux/reiserfs_fs.h
>
>Hans, did you sneaky look through SCO's IP and use it when writing your code?
>
>
>					-J
>
>
>
>  
>
Hunh?

Do they claim that we call some function that infringes (I have no idea 
what, kmalloc or something....) or that our code in that file itself 
infringes?  When someone doesn't tell you what is allegedly infringing 
it is reallly hard to do anything.

It is really really hard to imagine do_balan.c infringing, as it is not 
interface code, and nobody else uses trees like we do, and thus it would 
be harder for it to be contaminated by ext2 code (I am always worrying 
someone will get lazy and use some ext2 code without my noticing it, and 
we audit the code before each time we license it to prevent that)  as 
part of someone conforming to VFS interfaces.....  though I do see some 
tiny bit of VFS interface code there in do_balan.c....

I had decided that this was something to ignore and let IBM deal with 
but, sigh......

I am coming more and more to believe that Microsoft is almost surely 
funding this lawsuit.  It is very much their style to do something like 
that.

-- 
Hans


