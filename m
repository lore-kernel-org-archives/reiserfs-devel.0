From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Help on reiserfs documentation
Date: Tue, 21 Sep 2004 22:44:47 +0200
Message-ID: <200409212244.47764.christian.mayrhuber@gmx.net>
References: <1095797478.862934535@as03.coolgoose.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1095797478.862934535@as03.coolgoose.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 21 September 2004 23:11, Mpriyan wrote:
> Hello All,
> 
> I'm learning about reiserfs. So, I'm looking for some documentation that can
> explain how the file data is organized on disk in reiserfs 3.6. The
> documentation that is available in www.namesys.com says that it is for 
reiserfs 4.
> 
> Do reiserfs 3.6 and reiserfs 4 have same ondisk structure ? I understand 
that
> they differ in the way they provide the atomicity. But other than that do 
they
> have the same layout ?

No they are different.
If you want to do some development/dig deeper you should look at reiser4, as 
it supports plugins and fixes some design mistakes reiser3 had and it has
cleaner code. I guess this is the cause why the reiser3 documentation has 
disappeared from the namesys homepage.
http://www.namesys.com/v4/v4.html is a good starting point.
The other documentation I know of is the reiser4 source code available
in recent -mm kernel series :-)

> 
> Does reiserfs 3.6 use B+ tree for storing its data ? In the source code,
> it looks like they use some stree. Are there standard definitions of stree
> ? Or is it a variant of B+ tree with a different name ?
> 
> If someone can point me to some documentation, it would be of great help.
> 
> -M
> 

-- 
lg, Chris

