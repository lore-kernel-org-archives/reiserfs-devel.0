From: Marcelo Pacheco <marcelo@macp.eti.br>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Fri, 9 Jul 2004 17:06:54 -0300
Message-ID: <200407091706.54256.marcelo@macp.eti.br>
References: <20040709165924.27fabe63@philou.gramoulle.local> <200407091724.43326.marcel@hilzinger.hu> <40EEBC97.5090703@burst.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40EEBC97.5090703@burst.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

When you delete a file what you need to do is to remove the directory entry, 
the inode and the file allocation structures. Reiser3 uses one key per file 
block (4kb), while reiser4 uses extents, which could be huge (100's of MB) 
per key, so there's far less things to remove when you remove a huge file on 
Reiser4 than on Reiser3.

Marcelo Pacheco

Em Sex 09 Jul 2004 12:41, Chris Humphries escreveu:
> WHOA!
>
> Marcel Hilzinger wrote:
> > You mustn't belive in Benchmarks :-). Try it empirically, and you will
> > see, that for big files, Reiser4 is much faster, then ReiserFS was.  Some
> > example
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
