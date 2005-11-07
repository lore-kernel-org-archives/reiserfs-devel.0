From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: 2.6.14-rc5-mm1/2.6.14-mm1 reiser4-update-for-2.6.14-rc5-mm1-1
 still get lockups
Date: Mon, 07 Nov 2005 17:31:38 +0300
Message-ID: <436F654A.3050705@namesys.com>
References: <436F58B9.6040105@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <436F58B9.6040105@arcor.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?RnJpZWRlciBCw7xyemVsZQ==?= <linux-stuff@arcor.de>
Cc: reiserfs-list@namesys.com

Hello

Frieder Bürzele wrote:
> Hi,
> 
> i´ve tried the new update-patch reiser4-update-for-2.6.14-rc5-mm1-1 with
> 2.6.14-rc5-mm1/2.6.14-mm but it locks if I run a script that try to
> untar/cp/rm
> stuff on that partition:
> 

Does the system lock completely, or processes can not complete?

> 
> this messages I got:
> 
> <4>reiser4[ktxnmgrd:hda1:r(4321)]: disable_write_barrier
> (fs/reiser4/wander.c:233)[zam-1055]:
> WARNING: disabling write barrier
> 
> or this
> 
> <4>reiser4[tar(21136)]: disable_write_barrier
> (fs/reiser4/wander.c:233)[zam-1055]:
> WARNING: disabling write barrier
> 
these are harmless.

> 
> with the reiser4 patch from 20.10.2005 + reiser4-fix-livelock-2.patch +
> reiser4-spinlock-cleanup-2.patch
> all works fine
> 

We also have found some problems with this patch. We hope to make a new patch today.
