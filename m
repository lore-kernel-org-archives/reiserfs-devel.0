From: "Jason Mancini" <jayrusman@hotmail.com>
Subject: 640.0 GB symlink
Date: Tue, 03 Dec 2002 21:02:38 -0800
Message-ID: <F166w0wQDoKK0jocxmW00010062@hotmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


$ tar czvlf root.tgz /
...
tar: memory exhaused

Hmmm.  The short story, tar dies on libz.so symlink.

$ ls -l /usr/lib/libz.*

-rwxr-xr-x    1 root     root        72302 Jun  7 06:33 /usr/lib/libz.a*
lrwxrwxrwx    1 root     root 687194767373 Jun  9 16:36 /usr/lib/libz.so -> 
libz.so.1.1.4*
lrwxrwxrwx    1 root     root           23 Jun  9 16:36 
/usr/lib/libz.so.1.1.4 -> ../../lib/libz.so.1.1.4*

$ ls -l ../../lib/libz.*

lrwxrwxrwx    1 root     root           13 Jun  9 16:36 ../../lib/libz.so.1 
-> libz.so.1.1.4*
-rwxr-xr-x    1 root     root        57584 Jun  7 06:33 
../../lib/libz.so.1.1.4*

I rebooted with init=/bin/bash
"reiserfsck --check /dev/hda1" revealed no errors.

Mandrake kernel 2.4.19-19mdk.
reiserfsprogs-3.6.3-1mdk

Should I just erase and remake the symlink?
It wasn't like this in July (my last backup, *cough*).

In the mean time, I will use tar's --exclude option...

Thanks,
Jason Mancini
<jayrusman@hotmail.com>


_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963

