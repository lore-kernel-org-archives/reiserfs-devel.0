From: "enediel gonzalez" <enediel@hotmail.com>
Subject: having problems to recover information
Date: Tue, 27 Sep 2005 20:26:18 +0000
Message-ID: <BAY104-F308B253009F6EA564D2E98A58A0@phx.gbl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hello everyone

I have two debian 3.1 installed with the following configuration

/etc/fstab
# /etc/fstab: static file system information.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
proc            /proc           proc    defaults        0       0
/dev/sda6       /               reiserfs defaults        0       1
/dev/sda1       /boot           reiserfs notail          0       2
/dev/sda5       none            swap    sw              0       0
/dev/hdc        /media/cdrom0   iso9660 ro,user,noauto  0       0

after I made
shutdown -h now

I could restart my pc again, it looks a bad sector on my hard disk
error reported on sd6

I put the hard disk with problems as slave disk on the second pc, to try to 
at least recover some information

fsck doesn't help me
reiserfsck neither

my question is, which tool could help me to recover at least some 
subdirectories

thanks in advance for any answer

Enediel


