From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: when is it decided that extent pointer is to be created in reiser4
Date: Mon, 21 Feb 2005 17:26:15 +0000 (GMT)
Message-ID: <20050221172615.70993.qmail@web60109.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser-list mailing <reiserfs-list@namesys.com>

hello,

     as far as i know tree based file systems use
extents for managing free space. does reiser4 use a
bitmap based method or extents to keep track of used
and free blocks.
      another issue is that when i tried storing a
small file an extent pointer was created for the file
which was also the case for a large file. but to my
knowledge extent pointers are created for large files
and in some file systems there is a fixed limit to the
file size after which it is assigned an extent
pointer.
wat is the policy used in reiser4 to decide which
files should be stored using extent pointers and which
should not.
      also from what i have observed each file has a
unique key representing it in reiser4. is there any
specific key generation algorithm for file names and
if yes where could i find it. is it possible that
instead of passing single file names to the key
generation algorithms we could pass the entire path to
generate a unique key.

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
