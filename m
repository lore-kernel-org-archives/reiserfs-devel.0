From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Reiser4 terribly slow
Date: Wed, 24 Jan 2007 22:05:53 +0800
Message-ID: <6ec7a4340701240605x43297e01xdee68fb7f1d69746@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!

I've got a benchmark about "reiser4 on mysql" and found a remarkable
extremely low performance, i managed to turn off fsync() in
fs/reiser4/plugin/file/file.c (nullify the sync_unix_file() function),
but it STILL VERY SLOW. I could not found any information about both
in the mailing-list and google-groups. Here is the detail:

C2.26+I845G+256MB+WD80GB
Slackware 11.0(Vanilla 2.6.18.3+r4_patch+1.0.5)
mysql-5.0.24a
testing use the "sql-bench", all result in seconds.

          Alter  ATIS  Big  Connect  Create  Insert
Ext3.o   32     21    25      221        203    1979
JFS      15     21    25      223        114    1711
XFS     22     22    25       229      1091    1744
R3        29     20    25      224        194    1731
R4        70     73    27      276       2667    3499
nofsync 51     72    26      271        594    3227

Seems even R4 w/o fsync speeds up abit, it's still TERRIBLY SLOW.
could you tell me why?

THANKS!
