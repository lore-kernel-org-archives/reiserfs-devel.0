From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4 mount support, Grub support
Date: Tue, 24 Aug 2004 19:51:03 +0400
Message-ID: <200408241951.03100.vitaly@namesys.com>
References: <e7963922040819082125b7d8aa@mail.gmail.com> <e796392204081923407c8b8938@mail.gmail.com> <e7963922040819234234cca45f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e7963922040819234234cca45f@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Schweizer <sschweizer@gmail.com>, reiserfs-list@namesys.com

On Friday 20 August 2004 10:42, Stefan Schweizer wrote:
> > Ah, and symlinks are grub related also?
>
> Sure, they are grub related - but many people have a /usr/src/linux -
> so if someone really had tried the grub patch he would have recognized
> it. In fact it does not work at its current stage if I cannot boot a
> kernel Image and if I cannot boot it from the symlink ..

I detected the problem with symlinks -- 32K that grub provides gets 
too fragmeted when grub is trying to get the kernel image through 
a symlink. I have changed the allocation in libaal a bit (enabled only
with configure --enable-memory-manager) and it works for me now. 
You can obtain the snapshot from: 
	http://www.namesys.com/snapshots/2004.08.24/
It also includes a pair of bugfixes. Try it please and report me about 
the result.

-- 
Thanks,
Vitaly Fertman

