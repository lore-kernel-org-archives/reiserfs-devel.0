From: "Lawrence Bowie" <thesource@ldb-jab.org>
Subject: Encrypted Filesystem and SuSE 9.3
Date: Tue, 13 Dec 2005 08:25:41 -0600
Message-ID: <20051213141924.M29451@ldb-jab.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Oh boy!!

I feel stupid at this point because I am without backups!!

I had an encrypted reiser filesystem on my SuSE 9.3 laptop.
I attempted an upgrade from 9.3 to 10.0 and it did not like
the upgrade for some reason. :(

Here are the current details ...

The OS thinks that the encrypted reiser partition is a
reiser partition but it is not at all. It should be recognized
as "unkonwn" like the other encrypted partitions but it is not.

Of course the normal tools like "debugreisferfs" and "reiserfsck"
and do not work properly because it is encrypted.

Can anyone help me get out of this quagmire?

Thanks,

LDB
