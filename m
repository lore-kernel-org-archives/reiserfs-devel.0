From: "Yury V. Umanets" <umka@namesys.com>
Subject: Re: [jedi@ninja.dynup.net: Re: V4 status]
Date: Fri, 05 Dec 2003 12:20:05 +0300
Message-ID: <1070616004.15376.9.camel@firefly>
References: <20031205085814.GD1926@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031205085814.GD1926@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jedi@ninja.dynup.net
Cc: reiserfs-list@namesys.com

On Fri, 2003-12-05 at 11:58, Alex Zarochentsev wrote:
> Fredrik Tolf wrote:
> 
Hello,
> >May I ask what the current stability status is for V4? Is there mayhap
> >a HTTP resource for it that I have not found?
> >
> >Fredrik Tolf
> >
> > 
> >
> 
> I believe patching your kernel will not hurt anything else, and mounting 
> a filesystem will probably not hurt anything else.
> 
> I have a laptop on which I use Reiser4 for everything but /boot (as v4 
> is not supported by grub
It is supported, however patch is not yet sent to GRUB maintainer. The
reason is that, reiser4 support for GRUB is based on our libreiser4 and
its interface is under development now. Yet another reason, GRUB
maintainer had some troubles with moving to another country some time
ago and was not able to accept any emails.

>  and v3 was never supported very well). 
I thought, that it is supported good enough :) Can you be more specific
on this?


-- 
umka

