From: Chris Mason <mason@suse.com>
Subject: new data logging patches available
Date: 08 May 2003 09:22:19 -0400
Message-ID: <1052400138.14612.483.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

New data logging patches are available for download at:

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

It might take the suse internal ftp server an hour to see the new
files.  Check for 03-relocation-8.diff to make sure you are grabbing the
most recent stuff.

These include Oleg Drokin's merge with 2.4.21-rc1 (thanks Oleg!), and
they no longer change fs/super.c:sync_supers().  I believe things are
now clean enough for me to start submitting for 2.4.22-pre once it
starts.

03-relocation-8.diff is also updated, I believe it will fix the bug
where md reports the device is busy during reboot.  It has not been
tested on a box with a software raid root device, so please handle with
care.

-chris


