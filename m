From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: building reiserfsprogs, no asm/unaligned.h
Date: Sun, 2 Dec 2007 11:14:02 +0100
Message-ID: <20071202101402.GA14881@ska.dandreoli.com>
References: <5c7c368b0711300402l2f740carb2ad852291610bd1@mail.gmail.com> <5c7c368b0711300427k6287d43bq57f275d74e9fdc39@mail.gmail.com> <20071130082602.fdac4cfe.rdunlap@xenotime.net>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071130082602.fdac4cfe.rdunlap@xenotime.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

hi,

On Fri, Nov 30, 2007 at 08:26:02AM -0800, Randy Dunlap wrote:
> 
> The problem is more likely to be that this distro does not ship
> <asm/unaligned.h> ... so I copied /usr/include/asm-generic/unaligned.h
> from another system to /usr/include/asm/unaligned.h and built
> reiserfsprogs successfully.
> 
> I _guess_ that the problem is that unaligned.h is not one of the
> header files that is exported by the kernel's recent headers_install
> script(s).  Or just that some $distro(s) forgot to ship unaligned.h
> in /usr/include.  Anyway, I have it building now.

exactly. see bug 429006 at http://bugs.debian.org/429006.

cheers,
Domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
