From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: raid & mkreiserfs
Date: Wed, 9 Oct 2002 21:25:41 +0200
Sender: bernd-schubert@web.de
Message-ID: <200210092125.41389.bernd-schubert@web.de>
References: <200210082000.40632.bernd-schubert@web.de> <20021009091557.A11954@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021009091557.A11954@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Wednesday 09 October 2002 07:15, Oleg Drokin wrote:
> Hello!
>
> On Tue, Oct 08, 2002 at 08:03:35PM +0200, Bernd Schubert wrote:
> > for mke2fs there's an option for raid  and this option is suggested by
> > the software-raid raid howto.
> > Is there something similar for mkreiserfs ?
>
> No, here is nothing similar in mkreiserfs (because we don't have that
> "cylinder groups" stuff in reiserfs), though if you really have a system
> that is very capable of lots of parallel operations (like RAID1 system with
> lots of disks) you can play with new block allocator options (possible
> since 2.4.20-pre2)

Hello Oleg,

we want to install a RAID5 over 5 disks, but actually I don't want to play 
with options and with pre-kernels (its for a production system).

Thanks for your help,

Bernd
