From: Oleg Drokin <green@namesys.com>
Subject: Re: some troubles with mounting reiserfs
Date: Mon, 28 Apr 2003 09:38:07 +0400
Message-ID: <20030428053807.GB22902@namesys.com>
References: <000001c30ca7$50708910$0432a8c0@dell8100>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <000001c30ca7$50708910$0432a8c0@dell8100>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serge Rodrigues <serge@onpoi.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 27, 2003 at 12:25:18PM +0200, Serge Rodrigues wrote:
>             I have some troubles when I want to mount a reiserfs
> partition I use the command :
>             Mount -t reiserfs /dev/hdb1 /mnt/xxx
>             The result is
>             Mount : wrong fs type, bad options, bad superblock on
> /dev/hdb1 or too many mounted file systems

Well, what kernel version do you use?
What are the messages in kernel log? (e.g. run dmesg to see)

>             I've tried 
> fsck.reiserfs -check
>             The result :
>                         The problem has occurred looks like a hardware
> problem
>                         Check your hard drive badblocks
>                         Bread : Cannot read the block (17760256)

Hm, sounds like your partition is bigger than underlying block device and you recently have upgraded your kernel
to 2.4.21rc1 or something like that, no?

>             When I use : 
> debug.reiserfs /dev/hdb1
> The Result :
> <-------------debugreiserfs, 2002------------->
> reiserfsprogs 3.6.4
> Reiserfs super block in block 16 on 0x341 of format 3.6 with standard
> journal
> Count of blocks on the device: 20010808

Hm, but then debugfs should have complained too?

> How to solve this problem ??

We need to see what are the kernel messages.
also output of "fdisk -l /dev/hdb"

Bye,
    Oleg
