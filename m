From: Anders Widman <andewid@tnonline.net>
Subject: umount --force fails
Date: Wed, 9 Apr 2003 22:38:47 +0200
Message-ID: <715903125.20030409223847@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   Why can't I use "umount /mnt/disk --force"?

     [root]# umount /mnt/disk --force
     umount2: Device or resource busy
     umount: /dev/Server/Root: not mounted
     umount: /mnt/disk: Illegal seek

   No kernel errors are logged.

   The reason why I want to use "--force" is that I have Samba running
   sharing this folder (plus many others). I do not want to stop Samba
   just to unmount just one of the filesystems.

   Is there a way that I can get around this? I thought that "--force"
   would  force  an umount of the filesystem even if some program were
   using it?

   //Anders

