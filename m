From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Filesystem repair and Data Recovery
Date: Fri, 01 Jul 2005 16:19:22 +0400
Message-ID: <1120220361.3603.62.camel@tribesman.namesys.com>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050701112954.B2F849FF0@mail.mak.ac.ug>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Flora Dru <dru@dicts.mak.ac.ug>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2005-07-01 at 15:29, Flora Dru wrote:
> Hi, 
> 
> our reiserfs partition that holds our institutions mails got corrupted 
> (27GB).

Can you please provide more details? Does it refuse to mount? Do you get
kernel warnings when you try to access files on it? Did it get
unreadable blocks?

>  A colleague that was around tried to recover it but failed. So he 
> changed the filesystem to ext2 in /etc/fstab and rebooted. the partition 
> came up but with some of its folders and files corrupted, some folders have 
> become executables with strange owners and permissions that dont respond to 
> cp, chmod, chown or mv commands. 
> 
> We created  an image of the corrupted files onto an ext2 partition  and 
> tried to repair it but files in lost+found had strange filenames. 
> 

Please run 
reiserfsck /dev/sda2
and let us know what does it say.
please make sure that you have the most recent reiserfsck with
reiserfsck -V. If it is not 3.6.19 - please upgrade:
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz



> We created another image file onto a remote host reiserfs partition using ( 
> ssh corrupthost dd if=/dev/sda1 conv=noerror > sda1.img) and did the 
> following: 
> losetup /dev/loop0 sda1.img
> reiserfsck --rebuild-sb /dev/loop0
> reiserfsck --rebuild-tree /dev/loop0 
> 
> but it failes with  "No reiserfs metadata" found error  and the log file 
> contains 
> 
> ####### Pass 0 #######
> Could not find hash in use. Using "r5"
> ####### Pass 1 #######
> ####### Pass 2 ####### 
> 
> 
> Please advise. 
> 
> Thanks
> Dru
> 

