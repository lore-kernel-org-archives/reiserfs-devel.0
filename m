From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 21:52:14 -0500
Message-ID: <42BCC6DE.4020909@slaphack.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB7B32.4010100@slaphack.com> <20050624124943.GA75817@dspnet.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050624124943.GA75817@dspnet.fr.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Olivier Galibert <galibert@pobox.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Olivier Galibert wrote:
> On Thu, Jun 23, 2005 at 10:17:06PM -0500, David Masover wrote:
> 
>>I was able to recover from bad blocks, though of course no Reiser that I
>>know of has had bad block relocation built in...  But I got all my files
>>off of it, fortunately.
> 
> 
> My experience shows that you've been very, very lucky.  I hope r4 is
> better in that regard.

I was on Reiser4.  And as Hans is loudly protesting, v3 seems to be
stable now, including being somewhat resilient to disk breakage.

But I do better backups now.

> If you want to try with r3, take a well-used partition[1] and copy it
> at block level to another partition or a file.  Then zero some random
> spans of blocks in the copy and reiserfsck --rebuild-tree it.  My
> experience is that you'll usually get the files names and directory
> tree but their contents will have been scattered all over the place.

Sometime I'll try that.  I do remember mounting read-only *before* I
tried the --rebuild-tree, because I didn't want to give it a chance to
screw up more that it already was.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQrzG3XgHNmZLgCUhAQKayQ//Z4R/1lKkjaiHfIrIpVXmLrGfcGUuVXLG
FeQb+50orlA6pfaHDJ5JkJKKyHnTsnNSvn+VHdxqvz25/ijWDoewe368syXSggOA
JkSUSvdQlcKn+dnpT8tPFY8OU3Ve87zb53fAI9J145DRLpXXmWjW5/R1OUzlPnmr
+nn2n32UvbSyUj8VAM9ECtJ3+HaxXKm0ASbQLKgLoLmJ5bO/u2xml7rGtB1kdaCr
xJIxugAaWnA/sytoK2vIsdnH4QFQqbuqW4bdHa3ziORS1w/DQ08PMFtxu/3ChKVQ
5d0cGtMsZkVIz+k4zE+3RD2QXZVLRvZCTwPqQciitvXCRqz3d9Wc73D+fC8FwLKx
t7aARQKprPDA/bgg4SPAoJSVxZMTJDATuJ5f6XrpDB/FVUmHYQfqNLhOD/Vl5IAA
9aZCPjDXMknClydasw/SiRu3DUiOIKYlXXUN1Tnsx4l9lbVJpca25TBem+0Val2P
IsruPiJ8L3XztRNwQJOY4RGH1CMobPnwEA4F9PFKqVF+wwJS5sNNqbkoD7XMrOT6
UYn3KC0DixgVCkl75nP6ORs8F9LjIuDtFd/+KNQC+AlcU5MX+BeaJD1QhT5G/1qd
GjRcQaN+95jVxLVjkqnb552dQ7+CMt/DzszFDtfKlJepobflVMtX1hoZ0phudAgR
PqjDS3tIROk=
=lkfJ
-----END PGP SIGNATURE-----
