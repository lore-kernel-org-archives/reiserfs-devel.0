From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: reiserfs on removable media
Date: Wed, 02 Jul 2003 14:23:13 -0400
Message-ID: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a 120GB reiserfs in a portable disk enclosure with USB2.0 and
IEEE1394 interfaces.  Unfortunately the current Linux USB and firewire
drivers in 2.4.21 still have nasty issues, with the result that I've had
too many crashes to count while working out how to get the device drivers
to talk to this disk reliably (probably 50 or more crashes so far).

Obviously these problems aren't reiserfs's fault, nor can reiserfs do
anything about these problems, but it's nice to see that reiserfs survives
as well as it does.

Two reiserfs improvements come to mind:

- There is a tendency for files that were being grown at crash time to
contain invalid data.  It seems that the inodes are being updated before
the data blocks they refer to are written.  It would be nice if the inode
writes were deferred (or at least made invisible) until after the data
blocks were written.  I'd rather lose my data than possibly have random
garbage masquerading as my data.

- If the device is detached while a filesystem is mounted, reiserfs gets a
whole lot of I/O errors (or worse) and immediately oopses.  It would be
nice if reiserfs would handle this a bit more gracefully--it should at
least let me kill processes with open files and umount the filesystem.
OTOH many other things also oops with with current USB/firewire/scsi device
driver stack too.  :-P

Otherwise, this particular reiserfs has survived all of the crashes so
far, even under the heavy I/O loads that seem to trigger the crashes.
Cool.
