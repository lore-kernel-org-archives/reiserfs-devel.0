From: "Szabolcs Szasz" <sz@szasz.hu>
Subject: Encouraged or discouraged? Object database directly on reiserfs
Date: Fri, 18 Oct 2002 15:21:31 +0200
Message-ID: <00ac01c276a9$463934e0$6400a8c0@twister>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm creating an OODB for use by ISPs. Now for the prototype 
I use plain filesystem storage, object properties (names, phone 
numbers, URLs etc.) are all stored in multitudes of very small 
files, collected into large directories and there are symlinks all 
over the place...

For any "classical" filesystems this is clearly a horrible abuse...

It may be for the current reiserfs level, too, but much less.

Considering the future (and remembering the Vision doc. at
Namesys), is it encouraged or discouraged to continue the
OODB implementation atop the native filesystem storage?
(Speed is important, but not the primary concern. Unconstrained,
solid and versatile data accessibilty beats it --  that's why the 
fs storage rather than adding a DBMS engine.)

Thanks very much,
Sab

