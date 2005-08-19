From: PFC <lists@boutiquenumerique.com>
Subject: Re: 15M files
Date: Sat, 20 Aug 2005 00:08:05 +0200
Message-ID: <op.svrzrr0gth1vuj@localhost>
References: <5a59ce53050819144970d07ab0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5a59ce53050819144970d07ab0@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: studdugie <studdugie@gmail.com>, reiserfs-mailing-list <reiserfs-list@namesys.com>


On Reiser4, I eperienced a really massive speedup when switching from  
berkeley to plain filesystem on my subversion repository.
But this is on reiser4. Try it ;)

Also you can really easily defragment your reiserfs database-directory :  
just tar and untar.


On Fri, 19 Aug 2005 23:49:40 +0200, studdugie <studdugie@gmail.com> wrote:

> Hello. I'm looking to replace a couple Berkeley DB data stores w/
> regular file system directories backed by reiserfs (3.6). The reason
> is Berkeley DB is slow especially for data w/ little or no locality of
> reference. I'm posting to this list because I would like to get some
> opinions on if reiserfs is suitable for the job. Currently there are
> 15,079,597 records in 1 of the database. If I moved to a directory
> based db it would result in 15,079,597 discreet files ranging in sizes
> from 1 byte to 1kb. I was reading the FAQ on the namesys site and it
> mentioned that the r5 hash supports 1,200,000 files w/o collision.
> Since 15M is 12.5x greater I'm expecting massive amounts of
> collisions. So the question becomes how bad should I expect it to be?
> Should I assume the file system can handle it or slow to a crawl?  I
> would really appreciate some feedback from the experts before I go
> ripping out the Berkeley DB code.
>
> Thanx.
>


