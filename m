From: "Jake Hawkes" <jake@infinitylimited.net>
Subject: shrink reiserfs
Date: Sun, 23 Jan 2005 08:48:14 -0700 (MST)
Message-ID: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>
Reply-To: jake@infinitylimited.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi.

resize_reiserfs says that there are already too many allocated blocks.

This isn't the exact error message, but I hope you get the idea.

jake@jacobh jake $ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda4              38G  7.1G   31G  20% /
/dev/hda2              16G   15G  1.6G  91% /mnt/xp
none                  506M     0  506M   0% /dev/shm


so how can this be possible if it is only 20% used?
