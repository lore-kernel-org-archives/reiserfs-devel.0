From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: cannot mount /dev/hdc1
Date: Tue, 25 Feb 2003 21:54:40 +0300
Message-ID: <200302252154.40034.vitaly@namesys.com>
References: <001701c2dcdf$6cc60650$5e01a8c0@roessler.dnsalias.net> <200302251848.05924.vitaly@namesys.com> <008501c2dcfb$ffcc0d20$5e01a8c0@roessler.dnsalias.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <008501c2dcfb$ffcc0d20$5e01a8c0@roessler.dnsalias.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ingo =?utf-8?q?R=C3=B6=C3=9Fler?= <roessler@gmx.de>, reiserfs-list@namesys.com

On Tuesday 25 February 2003 21:30, Ingo Rößler wrote:
> Hi Vitaly and Yury!
>
> > Do I understand correctly that you did not use any partitioner just
> > before
>
> it happened?
> Yes!
>
> But after hard reset, I have this dialog with my server:
>
> elsa:~ # chmod 0777 -R /home/.../letters
> chmod: getting attributes of `/home/.../letters/203.gif': Permission denied
> elsa:~ # rm /home/.../letters/203.gif
> rm: cannot remove `/home/.../letters/203.gif': Permission denied
> elsa:~ # chown root -R /home/.../letters
> chown: getting attributes of `/home/.../letters/203.gif': Permission denied

Do you mean that you get the partition mounted somehow? Or it could be mounted
for some time after the reset, and smth happened again and it cannot be mounted 
anymore? Could you tell about it in more details please.

Could you also send what does fdisk -l /dev/hdc say?

> Today I am planing a backup and after this a format.
> But ...
>
> Ok, tomorrow I do it:
>
> Backup of /dev/hdc1
> dd if=/dev/hdc1 of=/sicherung/home.img
> (Today I have not a 80 GB backup medium)
> Update the reiserfsprogs on version. 3.6.5-pre2
>
> dd if=/dev/hdc1 of=/tmp/super bs=4096 count=1 skip=16
> reiserfsck --rebuild-sb /dev/hdc1
> reiserfsck --check
>
> I hope, it is good. My hole life is on this disk!

so do not miss the backup step.

> The old Superblock I send to you Yury.

Yura is waiting for it. 

-- 

Thanks,
Vitaly Fertman
