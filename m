From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Wed, 23 Jun 2004 23:48:21 +0400
Message-ID: <20040623194820.GF5080@backtop.namesys.com>
References: <20040607115743.GA27255@chepelov.org> <20040608165733.GW8091@backtop.namesys.com> <20040608184629.GA6507@chepelov.org> <20040623153253.GC5080@backtop.namesys.com> <20040623192733.GA30720@chepelov.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040623192733.GA30720@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

On Wed, Jun 23, 2004 at 09:27:33PM +0200, Cyrille Chepelov wrote:
> Hi Alex,
> 
> > can you try
> > http://namesys.com/auto-snapshots/reiser4-2004.06.23-14.56-linux-2.6.7-rc3-mm1.diff.gz ?
> > 
> > there was a bug in readpages_unix_file() which affected reiser4_sendfile().
> 
> Unfortunately, this kernel FTBFS:
> 
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> arch/i386/kernel/built-in.o(.text+0xc7fc): dans la fonction << acpi_register_gsi >>:
> : undefined reference to `mp_register_gsi'
> make[1]: *** [.tmp_vmlinux1] Erreur 1
> make[1]: quittant le r?pertoire ? /usr/src/linux/build/traminer/linux-ketchup ?
> make: *** [stamp-build] Erreur 2

we enable PM and ACPI for curing that.

> 
> ... though I highly doubt it's reiser4's fault (this system can only
> support APM power management, not ACPI. I even disabled power management 
> completely in this second compilation, for the same result; .config.bz2
> attached, just in case. 
> Can you give me a patch against the Linus tree? 

There are rumors that the patch applies to and works for stock 2.6.7, but we
did not test that.

> 	-- Cyrille

-- 
Alex.
