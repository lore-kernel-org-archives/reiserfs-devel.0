From: Oleg Drokin <green@namesys.com>
Subject: Re: Filesystem corruption
Date: Thu, 14 Aug 2003 11:49:34 +0400
Message-ID: <20030814074934.GA3893@namesys.com>
References: <3F3A61C8.4060504@oceanfree.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F3A61C8.4060504@oceanfree.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Locke <locke@oceanfree.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Aug 14, 2003 at 12:05:28AM +0800, Locke wrote:
> the files. I'm guessing the reason why it recovered so little was 
> because that because I was running a 7.8GB+40GB LVM and the 40GB 
> pyhsical volume wasn't working and left it with only 7.8GB.

Yes of course.

> is_tree_node: node level 0 does not match to the expected one 1
> vs-5150: search_by_key: invalid format found in block 8838461. Fsck?

So LVM substitures zero filled blocks instead of data if physical volume
is unavailable.
Of course reiserfsck happily thrown all of those blocks out of the tree.

> And also when rebooting after the corruption I saw several error 
> messages for all drives, hda, hdb and hdg
> **
> hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hda: dma_intr: error=0x84 { DriveStatusError BadCRC }
> hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hda: dma_intr: error=0x84 { DriveStatusError BadCRC }

Also you should consider replacing your noisy IDE cable for primary IDE
controller with not noisy one. Or just run in lower UDMA mode.

> **The messages are copied from the FAQ in namesys.com because they 
> looked similar so I'm not sure if they're the exactly same.

Well, if they are not the same, you'd better write them down on paper.

> Is there anything I can try to recover more data?

You might try to get LVM up again and run reiserfsck --rebuild tree.
Some more stuff wuill be restored.
Though still you will have lots of files' content lost and there is no way
to restore it anymore.
Also use reiserfsck 3.6.11

Bye,
    Oleg
