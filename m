From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: Compile probs with yesterday's auto-snapshot
Date: Tue, 10 Aug 2004 21:27:52 +0200
Message-ID: <20040810212752.44a3dde7.reiser4@blinkenlights.ch>
References: <20040810192756.67EC115C33@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810192756.67EC115C33@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> 1. Only i386 and UML on i386 are supported.
> ddabbs: Big endian appears to be supported.

I don't think so.

Mounting a reiser4 partiton on ppc-linux doesn't work
(mount segfaults + kernel Oops)

I created the FS on x86, so it's not the fault of mkfs.reiser4
(I didn't even compile the userland-tools on ppc-linux)


Does namesys plan to support Big endian soon?

How about porting Reiser4 to eg. Solaris?
I think people would buy licenses for solaris-reiser4 :)


bye
 
