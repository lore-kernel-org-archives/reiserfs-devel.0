From: Joachim Bremer <joachim.bremer@ricardo.de>
Subject: File corruption with 2.4.20pre6
Date: Wed, 11 Sep 2002 12:41:25 +0200 (MEST)
Message-ID: <200209111041.g8BAfP230329@chekov.ricardo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11412-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

I've got an easy to produce file corruption with
linux-2.4.20pre6 and then tested with the file-write
patch on pre4. I verified the problem on 2 different machines -
1. Uniprozessor with an Athlon XP1600+
2. Dualprozessor with 2 Athlon MP2000+

On both machines exactly the same files are damaged.

To reproduce:

- unpack libtool-1.4.2.tar.gz
- switch into the resulting directory
- enter: ./configure --prefix=/usr

The generated file "libtool" is damaged. Just do an
./libtool and you will se weird errors. The same procedure
works OK on a ext2 filesystem with the same kernel.

Bye

Joachim

