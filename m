From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Mongo error while building HTML results
Date: Sun, 8 Aug 2004 10:33:58 +0400
Message-ID: <20040808063358.GE9811@backtop.namesys.com>
References: <20040806152923.4a4eedc7@philou.gramoulle.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040806152923.4a4eedc7@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Fri, Aug 06, 2004 at 03:29:23PM +0200, Philippe Gramoull? wrote:
> 
>  Hello,
> 
> After the latest snapshot successfully fixed my mount/umount bug, i ran some mongo benchmarks
> (first to mimic David Dabbs results here : http://dabbs.net/reiser4/mongo.html), i couldn't
> build the HTML results of the dd phases by using mongo_parser.pl. Mongo says that there are uninitialized data:
> 
> (i'm using mongo found here : http://thebsh.namesys.com/benchmarks/mongo-2004.07.26.tar.gz)
> 
> I posted the 3 log files and the config file here:
> 
> http://philou.org/linux/reiser4/mongo/reiser4.tbl
> http://philou.org/linux/reiser4/mongo/reiserfs.tbl
> http://philou.org/linux/reiser4/mongo/ext3.tbl
> http://philou.org/linux/reiser4/mongo/config-2.6.8-rc2-mm2

did you use LOG= option? where those *.tbl files are from? 

> 
> The broken HTML output is here:
> 
> http://philou.org/linux/reiser4/mongo/mongo.html
> 
> 
> While running the reiser4 mongo run i have the following error at the dd write sequence:
> 
> Argument "records" isn't numeric in addition (+) at ./mongo.pl line 445.
> Argument "bytes" isn't numeric in addition (+) at ./mongo.pl line 446.
> 
> 
> Thanks,
> 
> Philippe

Thank you.

-- 
Alex.
