From: "Steve Milo" <slavik914@mrbrklyn.com>
Subject: Reiserfsck --rebuild-tree rendered machine unbootable.
Date: Wed, 15 Sep 2004 18:53:51 -0500
Message-ID: <20040915224812.M91258@mrbrklyn.com>
Reply-To: slavik914@mrbrklyn.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello, I was trying to erase some files in /var/run/sysconfig and
/var/run/smpppd on my Suse 9.1 box.  Logged in as root I would get 'permission
denied' when 'ls -l' or 'rm -f'.
I figured perhaps the filesystem had become corrupted somehow so I decided to
do  a reiserfsck --rebuild-sb.  That didnt fix what I persumed was a
permissions issue.
I then ran a reiserfsck --rebuild-tree and it found quiet a few problems and
appeared to have fixed them.  I decided to reboot and found that my machine
was rendered unbootable.  It goes into grub and I can get a grub prompt but I
receive 'hd(0,0) wrong filesystem' or something to that effect.
I did not make a backup copy of my filesystem like I should have, I figured I
could get away with not doing so.  I guess I was wrong.

Any help in this matter would be appreciated.

Thanks,
Steve M

--
Open WebMail Project (http://openwebmail.org)

