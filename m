From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: ReiserFS 3.5/3.6/ Reiser4 limits
Date: Sat, 05 Jun 2004 00:42:54 +0200
Message-ID: <40C0FAEE.8010901@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi,

first, let me point out an error in
http://www.namesys.com/faq.html#reiserfsspecs

The ReiserFS 3.5 on-disk format may support 4GiB-1 file size, but I have
not seen any 2.4 or 2.6 kernel supporting more than 2GiB-1 file size on
ReiserFS 3.5 disks. Please correct the table or the code, your choice.

Let me quote from http://www.suse.de/~aj/linux_lfs.html
>     *  On 32-bit systems with Kernel 2.4.x: The size of a file and a block device is limited to 2 TiB. By using LVM several block devices can be combined enabling the handling of larger file systems.
>     * 64-bit systems: The sizes of a filesytem and of a file are limited by 2^63 (8 EiB). But there might be hardware driver limits that do not allow to access such large devices.
>     * Kernel 2.6: For both 32-bit systems with option CONFIG_LBD set and for 64-bit systems: The size of a file system is limited to 2^73 (far too much for today). On 32-bit systems the size of a file is limited to 2 TiB. Note that not all filesystems and hardware drivers might handle such large filesystems.

Since you mention a 16 TiB file size limit on 32 bit, I have to assume
that either the 2 TiB file size limit on 32bit is no more or your page is
incorrect regarding this limit.

And what I'm especially interested in: What are the limits of Reiser4? I
couldn't find any information about it (maybe I didn't search long enough).


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/
