From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: debian bug #230482, rebuild-tree hangings and static linking
Date: Mon, 16 Feb 2004 22:57:16 +0300
Message-ID: <200402161728.16538.vitaly@namesys.com>
References: <20040214001629.GA4203@raptus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040214001629.GA4203@raptus>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com
Cc: 230482@bugs.debian.org

Hello Domenico, 

On Saturday 14 February 2004 03:16, Domenico Andreoli wrote:
> hi folks,
>
> i just read debian bug report #230482 [0] and followed link to some old
> thread about --rebuild-tree hangings when building libc version differ
> from run-time one.
>
> any advance towards solving it?

seems that the problem is missed gcc pic option.
i am fixing it now.

> talking about the workaround of building fsck statically, what about
> building it on a machin and running on another? would this still be a
> problem?

there has never been such problems when a program was built statically.

-- 
Thanks,
Vitaly Fertman


