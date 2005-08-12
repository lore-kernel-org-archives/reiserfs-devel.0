From: Danny <dannydaemonic@gmail.com>
Subject: warnings
Date: Fri, 12 Aug 2005 14:47:26 -0700
Message-ID: <9625752b05081214473613c37@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@Namesys.COM

I was compiling the very big open office and I ran out of disk space
when I ran across this warnings.  I was told it looks like a problem
with disk space reservation.  I'm using the vanilla Linux kernel
version 2.6.9 with the reiser4 patch I downloaded on April 20, 2005.

Aug 12 14:25:51 [kernel] reiser4[regmerge(31574)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:648)[nikita-2282]:

Aug 12 14:25:51 [kernel] WARNING: Partial conversion of 32991879: 0 of 4: -=
28

Aug 12 14:25:53 [kernel] reiser4[perl(2032)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:648)[nikita-2282]:

Aug 12 14:25:53 [kernel] WARNING: Partial conversion of 30405586: 0 of 2: -=
28

Aug 12 14:25:56 [kernel] reiser4[emerge(27458)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:648)[nikita-2282]:

Aug 12 14:25:56 [kernel] WARNING: Partial conversion of 25731985: 0 of 1: -=
28

Aug 12 14:25:56 [kernel] reiser4[emerge(27458)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:648)[nikita-2282]:

                - Last output repeated 2 times -

Aug 12 14:25:56 [kernel] WARNING: Partial conversion of 25731995: 0 of 4: -=
28

Aug 12 14:25:56 [kernel] reiser4[emerge(27458)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2377)[nikita-3233]:

Aug 12 14:25:56 [kernel] reiser4[emerge(27458)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:648)[nikita-2282]:

                - Last output repeated twice -
