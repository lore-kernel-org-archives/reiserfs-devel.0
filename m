From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Using plugins for reiser4?
Date: Mon, 26 Jul 2004 14:30:52 +0400
Message-ID: <200407261430.52558.vitaly@namesys.com>
References: <1604556800.20040725174028@tnonline.net> <4104DB3F.4050805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4104DB3F.4050805@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>, Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Monday 26 July 2004 14:21, Vladimir V. Saveliev wrote:
> Hello
>
> Spam wrote:
> >   Hello,
> >
> >   I  just been trying to understand the usage of plugins for reiser4 -
> >   or   more   specifically   how   to   enable  plugins  for  certain
> >   files, directories and/or to entrie devices.
>
> Have you looked at a big comemnt on top of reiser4/plugin/plugin.c?
>
> >   When  I  was patching my kernel to support reiser4 I saw there was a
> >   compression plugin that I'd like to know more about.
>
> It is under development.
>
> >   How  can  I  use  different  plugins  and  how  can  I get a list of
> >   supported  plugins.
>
> Source code is probably the right place to look at.
>
>   The "mkfs.reiser4 -l" doesn't list everything I
> >   found in the reiser4 kernel code.

some of them are not needed in the user space like pseudo file plugins.

some of plugins are not needed in the kernel space -- thus large & 
short key plugins would slow reiser4 a lot, whereas the library should 
be able to support all reiser4 filesystems at once without recompiling.

other inconsistencies are due to not finished developpement -- like
compression plugin.

-- 
Thanks,
Vitaly Fertman

