From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Cross compiling reiserfsprogs-3.6.11
Date: Fri, 21 Nov 2003 22:10:05 +0300
Message-ID: <200311212210.05199.vitaly@namesys.com>
References: <3FBDF571.5070100@sysgo.com> <3FBE1473.4060102@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FBE1473.4060102@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Pavel Bartusek <pba@sysgo.com>
Cc: Reiserfs-List@namesys.com

On Friday 21 November 2003 16:34, Carl-Daniel Hailfinger wrote:
> Pavel Bartusek wrote:
> > Hi list,
> >
> > I have downloaded and tried to crosscompile the reiserfsprogs-3.6.11.
>
> [...]
>
> > -#define _GNU_SOURSE
>
> Vitaly, are you aware that the above is a typo and will not work.

Yes, it was already fixed in 3.6.12-pre1, but anyway thanks a lot.
Vitaly Fertman


