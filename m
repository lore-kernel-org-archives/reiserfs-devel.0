From: Moritz Angermann <moritz.angermann@gmx.net>
Subject: Re: 3 corruptions found which can only be corrected
	via --rebuild-tree...
Date: 18 Jul 2002 21:36:39 +0200
Sender: Moritz Angermann <cone@caos.mine.nu>
Message-ID: <1027020999.651.3.camel@prototype>
References: <20020718152035.GA779@caos.mine.nu>
	<200207181134.01409.kuba@mareimbrium.org>
	<1027006557.995.2.camel@prototype> 
	<200207181231.43113.kuba@mareimbrium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11058-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207181231.43113.kuba@mareimbrium.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kuba Ober <kuba@mareimbrium.org>
Cc: reiserfs-list@namesys.com

well this is what i was going to do, sorry for my sounding like an
idiote and total newbee.
there are 2 reasons i'm so over careing.
#1 once i did --rebuild-tree, it f***ed my whole system
#2 i don't want to destroy anything, and therof want to get 100% sure ;)
so i hope you get what i mean ;)

i got an idea which i had in mind at first.
but i don't know reiserfs in detail and i don't know 
so much about FS's 
but wouldn't it be cool, just to mark that 2 files as 'dead'
like 'deleting' them ? and though just overwriting the part of the disk
? or handling it as 'free' ? s.th. like reiserfsdel <file>
or some thing that like.

regards -moritz

Am Don, 2002-07-18 um 18.31 schrieb Kuba Ober:
> On czwartek 18 lipiec 2002 11:35 am, you wrote:
> > nice idea, so here is what my partition layout looks like:
> > could you now tell me what commands i shall run exactly ?
> More-or-less exactly. I suggest you buy a linux/unix book. You *need* to know 
> and understand what you are doing.
> 
> > [17:25][cone@prototype:~]$ df -h
> > Filesystem            Size  Used Avail Use% Mounted on
> > /dev/hda6             4.7G  3.6G  1.1G  77% /
> > /dev/hda1              28M   11M   16M  40% /boot
> > /dev/hda7             4.7G  3.5G  1.2G  75% /home
> > /dev/hda8              14G   14G  2.0M 100% /media/music
> > /dev/hda9              14G  2.1G   12G  15% /media/movie
> > /dev/hda10             19G  9.9G  8.3G  55% /backup
> > /dev/hdb5              19G  5.9G   13G  32% /media/disk0
> > /dev/hdb6              19G  8.6G   11G  46% /media/disk1
> > /dev/hdb7              19G  7.8G   11G  42% /media/disk2
> 
> 1. Get rid of /home - dump it somewhere
> 2. Copy the boot partition
> # telinit 1
> # sync; sleep 10; dd if=/dev/hda6 of=/dev/hda7
> 3. Edit your bootloader so that the kernel knows that the root is /dev/hda7 
> # vi /etc/grub.conf or /etc/lilo.conf
> 4. Reboot
> 5. Fix and restore
> # reiserfsck -V
> Make sure it's 3.6.2 or newer
> # reiserfsck --rebuild-tree /dev/hda6
> # vi /etc/grub.conf or /etc/lilo.conf
> -- restore the kernel's root
> 6. Reboot
> 7. Redo filesystem on home
> # mkreiserfs /dev/hda7
> 7. Restore your /home partition
> 
> Cheers, Kuba Ober
> 

