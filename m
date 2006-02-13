From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.15 Bug? New security model?
Date: Mon, 13 Feb 2006 08:39:07 -0800
Message-ID: <43F0B62B.9080002@namesys.com>
References: <200602080212.27896.bernd-schubert@gmx.de>	<200602081314.59639.bernd-schubert@gmx.de>	<20060208205033.GB22771@shell0.pdx.osdl.net>	<200602082246.15613.bernd-schubert@gmx.de>	<20060208221124.GN30803@sorel.sous-sol.org> <20060212005541.107f7011.vsu@altlinux.ru> <43F01D70.70600@namesys.com> <43F0A4BA.20401@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932153AbWBMQj0@vger.kernel.org>
In-Reply-To: <43F0A4BA.20401@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Sergey Vlasov <vsu@altlinux.ru>, Bernd Schubert <bernd-schubert@gmx.de>, Chris Wright <chrisw@sous-sol.org>, John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

Ah, thanks for the patches Jeff, apologies for misreading it.

Hans

Jeff Mahoney wrote:

> Hans Reiser wrote:
>
> >This is an xattr bug, and I'll let jeff answer it.
>
>
> Hans -
>
> This bug is about inode attributes (the chattr type), not extended
> attributes (the setfacl/setfattr type). Regardless, it's the root cause
> of the random attributes we were seeing when the REISERFS_ATTRS
> enable-by-default problem was corrected. Thanks to some other people on
> the list, I was able to post some patches to address it yesterday evening.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs
