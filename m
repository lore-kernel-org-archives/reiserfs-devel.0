From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: reiserfs3, rsync and hardlinks
Date: Sun, 6 Feb 2005 03:41:02 +0100
Message-ID: <20050206034102.3956432d@polo.concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


	Hi all,

I'm using rsync to make a full backup of one box to another. Both are using
reiserfs 3.6.
The problem is that at the end of the backup, some pairs of unrelated files
(usually 3 or 4), are hardlinked together.

From what I've read in rsync mailing list archives, it probably means that
inode numbers are being reused while the backup is in progress.

Does that look plausible to you ?

And if it is, what can be done to significantly lower the probability of
inode number reuse over a short time ? The backup shouldn't take over 1
hour, the server stores around 570k files, but it's only a quite low traffic
IMAP server, so even with 32 bits inode numbers there's probably some room
for improvement.

I know a definitive answer would be to backup filesystem snapshots, but the
source server isn't currently using LVM1, and as far as I know snapshots
haven't been reimplemented yet for LVM2 :(

Best regards,
Pierre.
