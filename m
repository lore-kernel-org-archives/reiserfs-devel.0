From: Mihai Rusu <dizzy@roedu.net>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Sat, 10 Jul 2004 13:40:18 +0300 (EEST)
Message-ID: <Pine.LNX.4.58L0.0407101337220.6235@ahriman.bucharest.roedu.net>
References: <20040709165924.27fabe63@philou.gramoulle.local>
 <200407091724.43326.marcel@hilzinger.hu> <40EEBC97.5090703@burst.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40EEBC97.5090703@burst.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Humphries <chris@burst.net>
Cc: reiserfs-list@namesys.com

On Fri, 9 Jul 2004, Chris Humphries wrote:

> WHOA!

Try benchmarking XFS for deleting large files too if there is any point in 
that :)

Anyway, bonnie++ offers a very good benchmark for those interested in
having large mail servers, web servers with tons of small filess
created/read/deleted randomly. And that is where reiserfs3/4 shines above
all others except the reiser4 regression with its random deletes which I
also reported it some time ago on this list :-/

> 
> Marcel Hilzinger wrote:
> > 
> > You mustn't belive in Benchmarks :-). Try it empirically, and you will see, 
> > that for big files, Reiser4 is much faster, then ReiserFS was.  Some example
> > 
> > Deleting a 6,8GB DVD iso image (average of 10 tests):
> > ext3			14,15 sec
> > reiser3.6	12,67 sec
> > reiser4		1,23 sec
> > 
> > Deleting 3 GB of MP3 files (4MB average file size, 10 tests):
> > ext3			11,91 sec
> > reiser3.6	4,56 sec
> > reiser4		1,86 sec
> > 
> > Marcel
> 
> 

-- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
