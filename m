From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: building reiserfsprogs, no asm/unaligned.h
Date: Fri, 30 Nov 2007 08:26:02 -0800
Message-ID: <20071130082602.fdac4cfe.rdunlap@xenotime.net>
References: <5c7c368b0711300402l2f740carb2ad852291610bd1@mail.gmail.com>
	<5c7c368b0711300427k6287d43bq57f275d74e9fdc39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0711300427k6287d43bq57f275d74e9fdc39@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Fri, 30 Nov 2007 15:27:57 +0300 Edward Shishkin wrote:

> Hmm.. Try this one:
> http://chichkin_i.zelnet.ru/namesys/reiserfsprogs-3.6.19.tar.gz
> This is a tarball from namesys.com
> Make sure that installation process was okay.

That tarball matches the one that I downloaded from a Debian mirror:

$ ll reiser*
-rw-rw-r-- 1 rdunlap rdunlap 406895 Nov 30 03:54 reiserfsprogs-3.6.19.tar.gz
-rw-rw-r-- 1 rdunlap rdunlap 406895 Oct 15  2004 reiserfsprogs_3.6.19.orig.tar.gz
$ cmp reiser*
$

and hence contains the same #include line.

The problem is more likely to be that this distro does not ship
<asm/unaligned.h> ... so I copied /usr/include/asm-generic/unaligned.h
from another system to /usr/include/asm/unaligned.h and built
reiserfsprogs successfully.

I _guess_ that the problem is that unaligned.h is not one of the
header files that is exported by the kernel's recent headers_install
script(s).  Or just that some $distro(s) forgot to ship unaligned.h
in /usr/include.  Anyway, I have it building now.

Thanks for your help.

> The gpg-signature of this package is attached.
> My public key can be found here:
> http://marc.info/?l=reiserfs-devel&m=118505932502699&w=2
> 
> Thanks,
> Edward.
> 
> Randy Dunlap <rdunlap () xenotime ! net> wrote:
> > Hi,
> >
> > I was just trying to build reiserfsprogs-3.6.19 (got tarball
> > from Debian mirror since namesys.com is offline).
> >
> > include/reiserfs_fs.h #includes <asm/unaligned.h>, but I don't
> > have that file in /usr/include/asm-*.
> > Has anyone addressed this?

---
~Randy
