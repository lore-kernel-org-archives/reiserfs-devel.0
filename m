From: Oleg Drokin <green@namesys.com>
Subject: Re: Permission denied on access to files; even as root
Date: Mon, 17 Jun 2002 09:13:52 +0400
Message-ID: <20020617091352.B18719@namesys.com>
References: <1024353028.26879.10577.camel@xserver> <3D0CC8F8.9090206@namesys.com> <1024354235.21004.10629.camel@xserver> <20020616222011.A15910@namesys.com> <1024358539.26879.10782.camel@xserver> <1024374536.26879.11318.camel@xserver>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1024374536.26879.11318.camel@xserver>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 17, 2002 at 10:28:55PM -0600, Chris Worley wrote:

> Just give me a hint: if I can install/compile/lilo SuSE's
> kernel-source-2.4.16.SuSE-32.i386.rpm and the listed reiserfs tools,
> will my file system be repairable?  Most of /lib /usr/lib /usr/*bin and
> /*bin have become unusable.

Yes, usually reiserfsck fixes such a problem without any troubles and
all the files are accessible again.

You may even not compile SuSE kernel, but take precompiled one (and the tools
too) from updates. Though I do not know if they have LVM support suitable for
you.

Bye,
    Oleg
