From: =?ISO-8859-2?Q?Jakub_Ambro=BFewicz?= <ja@vigor.com.pl>
Subject: superblock problem
Date: Wed, 26 Jun 2002 13:22:21 +0200
Message-ID: <3D19A3ED.6040201@vigor.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi

I just lost my superblock. Not a big deal, i
reiserfsck --reuild-sb it, then --rebuild-tree.
After that i made --check and it found no
errors. But it's unmountable...
During boot my kernel (2.4.18, Debian/Woody) states:

super-459: read_super_block: super found at block 16
is within its own log. It must not be of this type.
read_super_block: can't find a reiserfs filesystem
on dev 16:42 block 8, size 1024

So i thought maybe i used wrong version and tried
all of the options, still no result. And now i stuck
with disk full of data which i can't get.
So, is there a method to mount|fix this partition, or
copy files out from it?

JA

