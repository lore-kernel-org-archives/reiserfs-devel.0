From: hkj@dmkuhlen.de
Subject: no space left, rebuild-tree not finished, partition not mountable
Date: Sat, 1 May 2004 15:38:38 +0200
Message-ID: <200405011338.i41Dcc515982@p15097155.pureserver.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi List!

I want to mount a partition to delete some files, because there isn't
any space on the partition anymore. I cannot mount it, because
--rebuild-tree didn't finish. It didn't finish, because there isn't
enought space on the partition anymore. So what should I do?

It's a ~110G Partition. I did dd_rescue to another device and
--rebuild-tree but still having the same problems.=20

Any hints?

Best regards

Hans Kuhlen

P.S.: ReiserFS 3.6? (SuSE9)
