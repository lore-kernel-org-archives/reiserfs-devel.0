From: Wayne Scott <wscott@bitmover.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 10:50:40 -0500 (EST)
Message-ID: <20040910.105040.30177815.wscott@bitmover.com>
References: <1094797973.4838.4.camel@almond.st-and.ac.uk>
	<4141504B.8030104@namesys.com>
	<4141CCA2.9010005@techsource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4141CCA2.9010005@techsource.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: miller@techsource.com
Cc: reiser@namesys.com, Peter.Foldiak@st-andrews.ac.uk, jamie@shareable.org, bunk@fs.tum.de, viro@parcelfarce.linux.theplanet.co.uk, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

From: Timothy Miller <miller@techsource.com>
> Everyone likes ':', so we'd have "problem/shoe:size".  (Don't bother to 
> complain about files which have : in them, because I already know it 
> sucks, but it's an example.)

[[ I just joined this discussion, so pardon if this is already known.]]

One advantage of ':' is that portable programs already have to avoid
it because of NTFS alternate data streams:
  http://www.diamondcs.com.au/index.php?page=archive&id=ntfs-streams

For example on an XP box with NTFS:

$ mkdir j
$ cd j
$ echo hi > foo:bar
$ ls -l
total 0
-rw-r--r--    1 wscott   Administ        0 Sep 10 10:45 foo
$ cat foo
$ cat foo:bar
hi
$ rm foo
$ cat foo:bar
cat: foo:bar: No such file or directory

-Wayne
