From: Sander Sweers <sandersweers@xs4all.nl>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 22:13:55 +0200
Message-ID: <4086D603.3010309@xs4all.nl>
References: <200404201733.51809.rmeijer@internet.gr> <200404211259.01802.rmeijer@internet.gr> <200404211547.08993.vitaly@namesys.com> <200404211509.20290.rmeijer@internet.gr> <13790.212.0.249.130.1082549980.squirrel@webmail.xs4all.nl> <4086CBBF.8010406@xs4all.nl> <20040421194414.GB6215@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040421194414.GB6215@raptus.homelinux.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Domenico Andreoli wrote:

>On Wed, Apr 21, 2004 at 09:30:07PM +0200, Sander Sweers wrote:
>  
>
>>NOTE: the ebuilds have /--enable-stand-alone/ to have grub build reiser4 
>>support.
>>    
>>
>
>how hard is to have reiser4 support built in grub?
>
>-----[ Domenico Andreoli, aka cavok
> --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
>   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
>
>
>  
>
Building reiser4 support is easy, the patch applies cleanly on grub 0.94.
You have to add option --enable-stand-alone for reiser4progs and libaal 
before grub + patch will build it.*
*If you use gentoo see bug# 46410.

**I have not tested it yet but am looking forward to it :)

Sander*
*
