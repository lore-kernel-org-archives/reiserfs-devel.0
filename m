From: =?ISO-8859-15?Q?Sven_K=F6hler?= <skoehler@upb.de>
Subject: root gets "access denied" on file-access
Date: Wed, 12 Jan 2005 02:08:16 +0100
Message-ID: <cs1t65$e6n$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

there is a installation of gentoo-linux on a remote-machine. It seems, 
the rootfs is somehow "damaged". On various files and directories, root 
gets the message "access denied". The rootfs is mounted without XATTR 
and ACL support. How can i check the rootfs? I cannot mount it read-only 
since it is "in use".

Gentoo's init.d scripts run "fsck -a" on the rootfs, but as far as i 
know, "-a" means, that fsck.reiserfs will only perform some fast checks 
and not a complete check.

There are some things that i don't understand:
- how can root get "access denied" to any file or directory on a local 
fs? May that be due to any damage of the filesystem?
- if the "access denied" is a reaction by reiserfs because it has found 
an error within the local fs, than why doesn't the reiserfs mark itself 
"damaged" so that at next boot, "fsck.reiserfs -a" will perform a full check
- if there is such a "damaged"- or "dirty"-flag, how can i set it manually?

BTW: reiserfs does not log anything. There aren't any messages written 
to "dmesg", /var/log/syslog, /var/log/message

