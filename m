From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel BUG at prints.c:334
Date: Mon, 6 Jan 2003 10:11:49 +0300
Message-ID: <20030106101149.B1881@namesys.com>
References: <hhr8bv7cm6.fsf@blah.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <hhr8bv7cm6.fsf@blah.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: phoner.reiserfs@blah.pl

Hello!

On Thu, Jan 02, 2003 at 05:14:25PM +0100, Maciej Matysiak wrote:

> reiserfs went mad on one of my machines. it's debian woody, with 2.4.20 kernel.
> in system logs i can see:

Logs you just provided show that your harddrive cannot remember what it was
supposed to store anymore.

> Jan  1 11:00:29 brzydal kernel:  I/O error: dev 08:21, sector 65704
> Jan  1 11:00:29 brzydal kernel: zam-7001: io error in reiserfs_find_entry
> Jan  1 11:00:29 brzydal kernel:  I/O error: dev 08:21, sector 65704
> Jan  1 11:00:29 brzydal kernel: zam-7001: io error in reiserfs_find_entry

See these IO errors? It cannot read the data off the HDD (/dev/sdc1).

> i've just tried to unmount the device. umount segfaulted, but the device is
> no longer mounted. in logs i can see:

Yes, reiserfs is not very well prepared to I/O errors while writing to journal,
hence it panicked.

> reiserfsck can't do anything:

No wonder, it cannot read anything off the disk either.

May be if you reboot or just keep the box off for some time and drive will
return to somewhat normal state, you will be able to
read something off it, but may be not. You will not know
for sure until you try.

> it's brand new, just 3 weeks ago installed. it's attached to:
> scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.8
>         <Adaptec 2940B Ultra2 SCSI adapter>
>         aic7890/91: Ultra2 Wide Channel A, SCSI Id=7, 32/253 SCBs
> what's wrong (disk or kernel?) and what can with this problem?

Try to reboot (halt, switch the box off, then turn it back on to be sure),
if everything will appear normal, then the problem is with
controller or aic7xxx driver most probably.
If the drive is still inaccessible, then the drive is bad.

> i'm a bit afraid to reboot the machine at the moment.

Since the disk cannot be read anymore, you have no much other choices I afraid.

Bye,
    Oleg
