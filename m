From: "=?utf-8?B?SW5nbyBSw7bDn2xlcg==?=" <roessler@gmx.de>
Subject: Re: cannot mount /dev/hdc1
Date: Tue, 25 Feb 2003 19:30:39 +0100
Message-ID: <008501c2dcfb$ffcc0d20$5e01a8c0@roessler.dnsalias.net>
References: <001701c2dcdf$6cc60650$5e01a8c0@roessler.dnsalias.net> <200302251848.05924.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Vitaly and Yury!

> Do I understand correctly that you did not use any partitioner just before
it happened?
Yes!

But after hard reset, I have this dialog with my server:

elsa:~ # chmod 0777 -R /home/.../letters
chmod: getting attributes of `/home/.../letters/203.gif': Permission denied
elsa:~ # rm /home/.../letters/203.gif
rm: cannot remove `/home/.../letters/203.gif': Permission denied
elsa:~ # chown root -R /home/.../letters
chown: getting attributes of `/home/.../letters/203.gif': Permission denied

Today I am planing a backup and after this a format.
But ...

Ok, tomorrow I do it:

Backup of /dev/hdc1
dd if=/dev/hdc1 of=/sicherung/home.img
(Today I have not a 80 GB backup medium)
Update the reiserfsprogs on version. 3.6.5-pre2

dd if=/dev/hdc1 of=/tmp/super bs=4096 count=1 skip=16
reiserfsck --rebuild-sb /dev/hdc1
reiserfsck --check

I hope, it is good. My hole life is on this disk!

The old Superblock I send to you Yury.

Ciao Ingo

