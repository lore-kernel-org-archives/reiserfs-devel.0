From: Asheesh Laroia <asheesh@asheesh.org>
Subject: Re: Need a boot disk with newest reiserfs tools
Date: Thu, 30 Oct 2003 13:38:09 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0310301336010.8142@renaissance.laroia.net>
References: <20031030181457.GA31387@the-love-shack.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20031030181457.GA31387@the-love-shack.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Malinovich <demonbane@the-love-shack.net>
Cc: reiserfs-list@namesys.com

Consider booting from a recent version of Knoppix.  Even if it doesn't
have the tools you need, you'll be able to download them and install them
in the ramdisk Knoppix provides you.  I think that the main Knoppix
distribution is RAID-aware, but I've never been lucky enough to have a
RAID setup on which to test it.

Consider passing it the option of not booting into a GUI if RAM is an
issue.

Also, do run badblocks or your RAID setup's physical-error-detection
program to make sure it's not that your disks are broken themselves.

-- Asheesh.

On Thu, 30 Oct 2003, Alex Malinovich wrote:

> Last night I attempted to resize my root partition (yes, I know, BAD
> IDEA :), using a GNU parted boot disk. Early on, it encountered an
> error and died, after which the partition became unbootable. I was
> still able to mount it from that boot disk, but there were plenty of
> errors in the process. So I ran a reiserfsck --fix-fixable which fixed
> a few problems, but left 56 problems that require --rebuild-tree.
>
> Unfortunately, every time I try a --rebuild-tree, after about 30
> seconds errors just start flying by on the screen. After about 30
> minutes of this, I get a timeout error and reiserfsck just dies. I've
> had success in the past with various reiserfs  problems by using an
> updated copy of the reiserfs progs, but as my root partition isn't
> bootable, and I have no space left to create another partition, I need
> a boot disk to do it. As such, I need a boot disk with a recent
> version of the reiserfs progs that can deal with a 3ware RAID array.
>
> My laptop still works, so if I need to make my own bootdisk somehow I
> can, unfortunately I have no idea of what's involved in the
> process. It's running Debian unstable so if you're familiar with any
> tools that would allow me to make a boot disk relatively easily with
> reiserfs support, I'd greatly appreciate it. TIA.
>
