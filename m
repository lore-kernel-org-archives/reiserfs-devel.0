From: Adrian Phillips <a.phillips@met.no>
Subject: Re: updated data logging and quota for 2.4.25
Date: Tue, 24 Feb 2004 12:59:39 +0100
Sender: "Adrian Phillips,,," <a.phillips@met.no>
Message-ID: <87llmsn0wk.fsf@freeze.oslo.dnmi.no>
References: <1077491080.26930.151.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077491080.26930.151.camel@watt.suse.com> (Chris Mason's
 message of "Sun, 22 Feb 2004 18:04:40 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

>>>>> "Chris" == Chris Mason <mason@suse.com> writes:

    Chris> Hello everyone, I've rediffed data logging and quota
    Chris> against 2.4.25.  The only patch that really changed was
    Chris> kinoded-9, but the others should give you fuzz free
    Chris> patching now too.

Many thanks for this and all your reiserfs contributions. One minor
problem while building without modules, the following line in
journal.h causes problems because modversions.h is not build when no
modules are built :-


    +#define EXPORT_SYMTAB
    +#include <linux/module.h>
     #include <linux/config.h>

modversions.h has :-

#else /* ! __GENKSYMS__ */
# if !defined(MODVERSIONS) && defined(EXPORT_SYMTAB)
#   define _set_ver(sym) sym
#   include <linux/modversions.h>
# endif

I removed the EXPORT_SYMTAB and it compiles and runs seemingly without
problems.

I haven't tested if this breaks module builds though.

Sincerely,

Adrian Phillips

-- 
Who really wrote the works of William Shakespeare ?
http://www.pbs.org/wgbh/pages/frontline/shakespeare/
