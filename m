From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: cannot mount /dev/hdc1
Date: Tue, 25 Feb 2003 18:48:05 +0300
Message-ID: <200302251848.05924.vitaly@namesys.com>
References: <001701c2dcdf$6cc60650$5e01a8c0@roessler.dnsalias.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001701c2dcdf$6cc60650$5e01a8c0@roessler.dnsalias.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ingo =?utf-8?q?R=C3=B6=C3=9Fler?= <roessler@gmx.de>, reiserfs-list@namesys.com


Hi, 

On Tuesday 25 February 2003 18:06, Ingo Rößler wrote:
> Hello,
>
> I hope You can help me!
>
> I get at the reboot of  my Suse7.1-Linux-server this message:
>
> mount -t reiserfs  /dev/hdc1 /home : mount: wrong fs type, bad option, bad
> superblock on /dev/hdc1, or too many mounted file systems
>
> This is my home-directory - my live!
>
> The harddisk is correct connected. It is a Western Digial 80 GB Harddisk
> with only this Partition hdc1.
>
> elsa:~ # cat /etc/fstab
> /dev/hda1       /windows        vfat            defaults                0 0
> /dev/hda2       swap            swap            pri=42                  0 0
> /dev/hda3       /               reiserfs        defaults                1 1
> /dev/hdc1       /home           reiserfs        defaults                1 2
> /dev/hda5       /home/backup          reiserfs        defaults
> 1 2
> /dev/cdrom      /home/mount/cdrom       auto            ro,noauto,user,exec
> 0 0
> /dev/dvd        /home/mount/dvd auto            ro,noauto,user,exec     0 0
> /dev/fd0        /home/mount/floppy      auto            noauto,user,sync 0
> 0 proc            /proc           proc            defaults                0
> 0 devpts          /dev/pts        devpts          defaults                0
> 0
>
> elsa:~ # reiserfsck --check /dev/hdc1
> <-------------reiserfsck, 2001------------->
> reiserfsprogs 3.x.0j
> reiserfs_open: neither new nor old reiserfs format found on /dev/hdc1
> reiserfsck: --rebuild-sb may restore reiserfs super block
>
> Now I boot with a newer OS: Knoppix, a CDROM-Linux-Distri:
>
> mount -t reiserfs  /dev/hdc1 /mnt
> read_super_block: can't find a reiserfs filesystem on (dev 16:01, block
> 128, size 512)
> read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 16,
> size 512)
> mount : Falscher Dateisystemtyp, ungЭltige Optionen, der "Superblock" von
> /dev/hdc1 ist beschДdigt oder es sind zu viele Dateisysteme eingehДngt.
>
> # reiserfsck --check /dev/hdc1
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.3
> reiserfs_open: neither new nor old reiserfs format found on /dev/hdc1
> reiserfsck:  could not open filesystem on "/dev/hdc1"
> Aborted

Do I understand correctly that you did not use any partitioner just before it happened?
If so, you should run reiserfsck --rebuild-sb to rebuild the super block of your 
fs, then reiserfsck --check and do what it will say. 

But you should update the reiserfsprogs version. 3.6.4 has one critical bug with 
rebuilding huge files, so you should use the latest pre version (3.6.5-pre2) from 
our ftp site (ftp.namesys.com/pub/reiserfsprogs/pre/).

-- 

Thanks,
Vitaly Fertman
