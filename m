From: Tom Vier <tmv@comcast.net>
Subject: Re: secure delete?
Date: Tue, 23 Mar 2004 21:36:12 -0500
Message-ID: <20040324023612.GA3880@zero>
References: <Pine.LNX.4.44.0403232055580.26868-100000@potato.zayda.com> <4060AEB9.1030200@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17418-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4060AEB9.1030200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

someone on l-k recently suggested storing a unique key in the inode. then
only the inode needs to be wiped to render all data blocks (including
strays) meaningless. i don't know how it was suggested this would be
implimented, but i would suggest generating the key at chattr +s time,
reading the file, encrypting it, and writing it back. that of course could
leave stray data, which is why new files should inherit +s from the dir
they're in. (i don't know what the rules are about +s inheritance - maybe it
needs chmod g+s on the dir).

btw, i wrote a file wiper which does blk and char devs, and regular files.
shameless plug:

http://wipe.sf.net/

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
