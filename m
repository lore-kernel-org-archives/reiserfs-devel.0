From: "Brian" <brian@english-bay.com>
Subject: Re: My mistake...
Date: Thu, 11 Jul 2002 10:45:01 -0700
Message-ID: <001c01c22902$aef10660$0e01a8c0@englishbay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10981-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hey Oleg:

> No, it was asking you about the superblock version.
> And if you have answered incorrectly, this is bad.

Oh, right you are.

I selected the latest version because that was what the logfiles reported
during boot for the other identical partition.

> Also what mount /dev/yourdevice /mnt -t reiserfs
> produces in kernel logs?

Here is the consol error report,

mount: wrong fs type, bad option, bad superblock on /dev/hdc2,
or too many mounted file systems

Here is what the syslog has to say,

Jul 11 10:39:20 bozo kernel: super-459: read_super_block: super found at
block 1
6 is within its own log. It must not be of this format type.
Jul 11 10:39:20 bozo kernel: read_super_block: can't find a reiserfs
filesystem
on (dev 16:02, block 8, size 1024)

It is all greek to me...

Any ideas?

Thanks,

Brian
BSFH
