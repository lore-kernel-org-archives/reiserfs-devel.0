From: elgaard <elgaard@agol.dk>
Subject: Re: corrupted reiserfs
Date: Mon, 6 Nov 2006 01:43:59 +0100
Message-ID: <200611060143.59695.elgaard@agol.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bones@huleboer.dk, reiserfs-list@namesys.com



I had the same problem. I wanted to debug it so i downloaded the
source (debian unstable), compiled it with CFLAGS="-g" and started it
in gdb.

Then it worked fine. The result of dpkg-buildpackage did not work, must be 
because it is stripped.
So it could be a compiler issue or a timing problem.

I was working on a dumped image on a new disk, and swapping RAM made no 
difference, 
so I do not think hardware problems was involved.

-- 
Niels Elgaard Larsen
