From: Alex Malinovich <demonbane@the-love-shack.net>
Subject: Need a boot disk with newest reiserfs tools
Date: Thu, 30 Oct 2003 12:14:57 -0600
Message-ID: <20031030181457.GA31387@the-love-shack.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Last night I attempted to resize my root partition (yes, I know, BAD
IDEA :), using a GNU parted boot disk. Early on, it encountered an
error and died, after which the partition became unbootable. I was
still able to mount it from that boot disk, but there were plenty of
errors in the process. So I ran a reiserfsck --fix-fixable which fixed
a few problems, but left 56 problems that require --rebuild-tree.

Unfortunately, every time I try a --rebuild-tree, after about 30
seconds errors just start flying by on the screen. After about 30
minutes of this, I get a timeout error and reiserfsck just dies. I've
had success in the past with various reiserfs  problems by using an
updated copy of the reiserfs progs, but as my root partition isn't
bootable, and I have no space left to create another partition, I need
a boot disk to do it. As such, I need a boot disk with a recent
version of the reiserfs progs that can deal with a 3ware RAID array.

My laptop still works, so if I need to make my own bootdisk somehow I
can, unfortunately I have no idea of what's involved in the
process. It's running Debian unstable so if you're familiar with any
tools that would allow me to make a boot disk relatively easily with
reiserfs support, I'd greatly appreciate it. TIA.
-- 
Alex Malinovich
Support Free Software, delete your Windows partition TODAY!
Encrypted mail preferred. You can get my public key from any of the
pgp.net keyservers. Key ID: A6D24837
