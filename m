From: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Subject: Re: Bug report: reiserfsck --rebuild-tree not progressing
Date: Tue, 11 Apr 2006 16:34:25 +0200
Message-ID: <20060411143425.GD12333@mathematik.uni-bielefeld.de>
References: <b19177749f9fd8399d24c21c4f355efd@pandora.com> <20060411072150.GA21772@favonius> <B3A1FB37-26AC-49F0-8CDB-A14FC93BF021@pandora.com> <1144747469.6188.36.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1144747469.6188.36.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On 11 Apr 2006 13:24, Vladimir V. Saveliev <vs@namesys.com> wrote:
> I would recommend you to abort it and try
> ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.20.tar.gz

Why is it in /pub/tmp? Is this an official new version?

This version compiles with no Problems on Debian 3.1 with gcc 3.3.5, but
compiling on Debian 3.0 (woody, old stable distribution, gcc 2.95.4) does
not work, even thogh 3.6.19 had no still compile problems:

$ make
[...]
gcc -DHAVE_CONFIG_H -I. -I. -I../.. -I../../include   -Wall -O2 -fPIC -DPIC
-Wall -O2 -fPIC -DPIC -c -o debugfs_reiserfs-corruption.o test -f
'corruption.c' || echo './'corruption.c
corruption.c: In function do_bitmap_corruption':
corruption.c:892: parse error before *'
corruption.c:907: i' undeclared (first use in this function)
corruption.c:907: (Each undeclared identifier is reported only once
corruption.c:907: for each function it appears in.)
corruption.c:910: bh' undeclared (first use in this function)
make[3]: *** [debugfs_reiserfs-corruption.o] Error 1
make[3]: Leaving directory /usr/src/reiser/reiserfsprogs-3.6.20/utils/debugfs'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory /usr/src/reiser/reiserfsprogs-3.6.20/utils'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory /usr/src/reiser/reiserfsprogs-3.6.20'
make: *** [all] Error 2

$ gcc -v
Reading specs from /usr/lib/gcc-lib/i386-linux/2.95.4/specs
gcc version 2.95.4 20011002 (Debian prerelease)

Bernhard
