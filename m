From: <doiggl@velocitynet.com.au>
Subject: Warning: mounting sdb with fatal errors, forcing read-only mount.
Date: Fri, 06 Mar 2015 18:17:33 +1100
Message-ID: <711c96e87d13f8b57fa62cce03bf0911@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

# mount /dev/sdb  /media/disk
mount: mount(2) failed: No such file or directory

dmesg shows:

Loading Reiser4. See www.namesys.com for a description of Reiser4.
reiser4[mount(21297)]: try_init_format40
(../fs/reiser4/plugin/disk_format/disk_format40.c:301)[vpf-1364]:
NOTICE: Warning: mounting sdb with fatal errors, forcing read-only mount.
reiser4: sdb: found disk format 4.0.0.


History:
http://www.spinics.net/lists/reiserfs-devel/msg04682.html
http://www.spinics.net/lists/reiserfs-devel/msg04688.html
