From: egilam@student.matnat.uio.no
Subject: Bug in scandir d_type
Date: Tue, 7 Dec 2004 18:07:59 +0100 (CET)
Message-ID: <28699.80.203.27.6.1102439279.squirrel@80.203.27.6>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22706-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello.

I am working with a program that uses scandir, using d_type to check if a
file has certain properties. It seems like that when used on reiserfs 3.6
(I haven't tried any other version), the d_type field is always 0 (zero).
When the program is moved onto an ext2 partition, it works. The example
program in "man scandir" works also the same way (just replace d_name with
d_type when printing out).

Kernel:  2.6.8.1 with reiserfs compiled in.

Egil M.
egilam at matnat.uio.no

