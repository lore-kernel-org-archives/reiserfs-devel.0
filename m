From: Derrell.Lipman@UnwiredUniverse.com
Subject: buffers not flushed when remounting read-only?
Date: Mon, 24 Jan 2005 16:25:11 -0500
Message-ID: <hdl6cyfc.fsf@random.internal>
Reply-To: Derrell.Lipman@UnwiredUniverse.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello.  I'm using reiserfs 3.6.19 and seem to be finding that the following
mount() call does not flush all buffers to disk.  I'm wondering if it is
expected that this should flush all in-memory buffers to disk:

   mount(device, path, "reiserfs",
         MS_MC_VAL | MS_NOATIME | MS_REMOUNT | MS_RDONLY, NULL)

The device was previously mounted for writing, much was written to it, and I do
this mount() command in preparation for writing the device the file system is
mounted on, to a DVD.  Once written to DVD, very occasionally, the DVD image
has a bad file system, as detected by either "reiserfsck --check" or an attempt
to mount it (which can hang with WCHAN = "wait_on_buffer").

I'm using Linux 2.4.27, Debian Sarge

Should remounting a file system as read-only flush all in-cache buffers to
disk?  Should I be able to copy the partition (/dev/hdaXX) in its entirety
following this remount, and have a clean file system in the copy?

Thanks,

Derrell

ps. I'm not subscribed to the list.  Please including me in any replies.
