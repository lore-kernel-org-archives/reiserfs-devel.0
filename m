From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: 2GB limit won't go away
Date: Mon, 10 Jun 2002 10:08:59 -0600
Message-ID: <20020610160859.GJ20388@turbolinux.com>
References: <1023708533.4654.301.camel@xserver> <20020609183534.GC14168@turbolinux.com> <1023754229.4654.1831.camel@xserver> <20020609231608.B8386@namesys.com> <1023780454.3999.52.camel@xserver> <20020610085822.A10921@namesys.com> <1023717954.6272.17.camel@localhost.localdomain> <1023718181.6272.21.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1023718181.6272.21.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

On Jun 10, 2002  08:09 -0600, Chris Worley wrote:
> # rm test.bigfile ;dd if=/dev/zero of=./test.bigfile bs=1k seek=1023M
> dd: advancing past 1098437885952 bytes in output file `./test.bigfile':
> File too large

OK, my bad.  This should have been:
dd if=/dev/zero of=./test.bigfile bs=1k seek=2047k

Even so, this probably won't fix your problem.  I would suggest creating
a test 3.6 format filesystem (loopback or such) and see if that works.
With the seek= argument you don't need a very big filesystem.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

