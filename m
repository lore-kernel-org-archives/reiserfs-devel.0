From: Oleg Drokin <green@namesys.com>
Subject: Re: Error after rebuilding file system tree
Date: Tue, 11 Feb 2003 14:08:34 +0300
Message-ID: <20030211140834.A18966@namesys.com>
References: <Pine.LNX.4.33.0302111049330.1265-100000@nnk.erl.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0302111049330.1265-100000@nnk.erl.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Mistelberger <Karl.Mistelberger@t-online.de>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Feb 11, 2003 at 11:01:55AM +0100, Karl Mistelberger wrote:
> Feb 11 08:02:54 nnk kernel: 3a:04: rw=1, want=26537940, limit=26529792
> Feb 11 08:02:54 nnk kernel: attempt to access beyond end of device

what does debugreiserfs /dev/your_device says?

>> Starting the system again resulted in:
> <4>reiserfs: found format "3.5" with standard journal
> <4>reiserfs: checking transaction log (lvm(58,4)) for (lvm(58,4))
> <6>attempt to access beyond end of device
> <6>3a:04: rw=1, want=26532716, limit=26529792
> <6>attempt to access beyond end of device

Hm.
1. please create metadata dump:
debugreiserfs -p /dev/yourdevice | bzip2 -9c >/path/metadata.bz2
Then make this metadata.bz2 file available for download.

2. Get newer reiserfsprogs from our ftp, and try to run rebuild-tree
with reiserfsck from latest reiserfsprogs.

Seems that your kernel found non-existent transactions in log.
Where is your kernel from? (what distro/version? any updates applied?).

Thank you.

Bye,
    Oleg
