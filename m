From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiser4progs 1.0.4
Date: Sun, 20 Feb 2005 13:44:41 +0300
Message-ID: <200502201344.41656.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello All

The new reiser4progs package is available on our ftp 
site (ftp://ftp.namesys.com/pub/reiser4progs/). 

It includes:

Bugfixes:
- in file body/extent item truncate code;
- in backup handling & traverse code;
- in journal unpack code;
- in node repair code;
- in not aligned access to on-disk data;
- in extent item-by-item insertion code;
- in tree balancing code;
- in SuperBlock handling code;
- in syncing code;
- in file body convertion code.

Enable libminimal by default.
Do not configure/install empty utils(resizer, cpfs).


A reiser4 support for grub 0.96 is available in
ftp://ftp.namesys.com/pub/reiser4progs/grub

-- 
Thanks,
Vitaly Fertman

