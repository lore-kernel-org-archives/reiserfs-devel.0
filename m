From: Oleg Drokin <green@namesys.com>
Subject: Re: illegal seek - unable to umount device
Date: Tue, 24 Jun 2003 09:48:09 +0400
Message-ID: <20030624054809.GA24126@namesys.com>
References: <200306231944.57478.gyim@freemail.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200306231944.57478.gyim@freemail.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gyimesi Akos <gyim@freemail.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 23, 2003 at 07:44:57PM +0200, Gyimesi Akos wrote:

> I have just encountered a problem (?) with reiserfs on Linux 2.4.20. I wrote 
> the following (shortened) python code which produced an unkillable process:
> #!/usr/bin/python
> file=open("terabyte_length_file", "w")
> file.seek(1024*1024*1024*1024)
> file.write("%c" % 0)
> file.close()
> On ext2, this code produced a file which had the (nominal) length of 1 
> terabyte and the real size of 16k. I ran this script on a reiserfs partition 
> as a normal user, and it
> 1. produced an unkillable process with 100% CPU usage
> 2. i was unable to kill it anyway, and i was unable to unmount the filesystem.
>    (Illegal seek, Device or resource busy). So finally i rebooted the system.
>    Of course, the rebooting process also got stuck as init couldn't umount
>    the device either.
> Naturally, i was not really surprised that this code didn't work on reiserfs, 
> but i was quite astonished by the fact that this dirty program could 
> practically "kill" the machine as a normal user - in a meaning that running 
> it several times consumes its CPU resouces and makes it impossible to unmount 
> the filesystem.

This is known problem and we hope to push the fix to Marcelo soon.
In short, the process is not stuck, it is busy creating file hole (4k at a time).
If you'd wait long enough, it will eventually finish.

Thank you for the report.

Bye,
    Oleg
