From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Tue, 26 Aug 2003 22:38:30 +0400
Message-ID: <20030826183830.GD25037@namesys.com>
References: <20030826102233.GA14647@namesys.com> <1061922037.1670.3.camel@spc9.esa.lanl.gov>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1061922037.1670.3.camel@spc9.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Cole <elenstev@mesatop.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hello!

On Tue, Aug 26, 2003 at 12:20:38PM -0600, Steven Cole wrote:
> >    I have just released another reiser4 snapshot that I hope all interested
> >    parties will try. It is released against 2.6.0-test4.
> >    You can find it at http://namesys.com/snapshots/2003.08.26
> >    I include release notes below.
> > Reiser4 snapshot for 2003.08.26
> I got this error while attempting to compile with reiser4.
> Snippet from .config follows.
> [steven@spc1 linux-2.6.0-test4-r4]$ grep REISER4 .config
> CONFIG_REISER4_FS=y
> CONFIG_REISER4_FS_SYSCALL=y

Do not compile sys reiser4 support. It is not yet ready.
(hm, probably I need to hide that option for next snapshot)


Bye,
    Oleg
