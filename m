From: Nick Orlov <nick.orlov@mail.ru>
Subject: clm-6005
Date: Sun, 14 Apr 2002 21:36:29 -0400
Message-ID: <20020415013629.GA13011@nikolas.hn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-10064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi All,

two days ago I have made a decision to make /usr readonly and remount it
rw only for upgrades (my /usr is on reiserfs).

today I have found next messages in my kern.log:

Apr 14 12:06:21 nikolas kernel: clm-6005: writing inode 275524 on
readonly FS
Apr 14 12:06:21 nikolas kernel: clm-6005: writing inode 275475 on
readonly FS
Apr 14 13:44:06 nikolas kernel: clm-6005: writing inode 82746 on
readonly FS
....and so on....

I'm not a kernel developer and i'm not familar with reiserfs code enough
to find this bug.

But it seems for me that something wrong with
fs/reiserfs/super.c:reiserfs_remount

P.S. kernel: 2.4.19-pre6-rmap12i, mount: mount-2.11n
P.P.S I'm not subscribed for this list, so please cc me
P.P.P.S sorry for my non-perfect english. I know that many reiserfs
developers are russian guys, so feel free to use russian :)

-- 
With best wishes,
	Nick Orlov.

