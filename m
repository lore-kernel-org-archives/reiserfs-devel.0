From: Oleg Drokin <green@namesys.com>
Subject: Re: raid & mkreiserfs
Date: Wed, 9 Oct 2002 09:15:57 +0400
Message-ID: <20021009091557.A11954@namesys.com>
References: <200210082000.40632.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200210082000.40632.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Oct 08, 2002 at 08:03:35PM +0200, Bernd Schubert wrote:

> for mke2fs there's an option for raid  and this option is suggested by the 
> software-raid raid howto. 
> Is there something similar for mkreiserfs ?

No, here is nothing similar in mkreiserfs (because we don't have that
"cylinder groups" stuff in reiserfs), though if you really have a system that is
very capable of lots of parallel operations (like RAID1 system with lots of
disks) you can play with new block allocator options (possible since
2.4.20-pre2)

Bye,
    Oleg
