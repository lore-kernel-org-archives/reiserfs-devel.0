From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Writeback from windows
Date: Tue, 27 May 2003 16:30:04 +0200
Message-ID: <3ED3766C.9090709@gmx.net>
References: <F759E5FC152E9446BB421B0D29F2A42708664C@osram_fs.osdomain.osram.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <F759E5FC152E9446BB421B0D29F2A42708664C@osram_fs.osdomain.osram.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eugene Grimsdell <e.grimsdell@osram.co.za>
Cc: reiserfs <reiserfs-list@namesys.com>

Eugene Grimsdell wrote:
> I have a problem in the sense of using a hardive in both windows and 
> Linux systems and in need of win32 writeback to reiserfs.

You mean write access, not writeback.

> Is there anybody on the list working on something or know of a 
> project that is doing this.
> 
> I know this can be done with ext2 or vfat but both needs scanning 
> after a powerdown and the NTFS support on Linux is lacking proper 
> writeback as well

For write access from Win32/Linux simply choose VFAT. Last time I
checked, the ext2 drivers for windows were still considered
experimental. If you have some money to spend, you can ask the reiserfs
developers to port reiserfs to Win32 or to extend VFAT support in Linux
so that it has transactions and does not need checking after a power
loss anymore.
*FAT has two copies of the FAT which are both active by default. You can
disable one of them, make changes to it, flip the active bit of both
copies, update the other copy, mark both active again. Regardless when
your power fails, you can avoid a time-consuming fsck.

Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

