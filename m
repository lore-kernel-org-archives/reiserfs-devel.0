From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: CONFIG_REISERFS_RAW (http://www.namesys.com/config.html)
Date: Sun, 16 Feb 2003 14:52:21 +0100
Message-ID: <200302161452.21451.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

can anyone tell me where I can find this code:


CONFIG_REISERFS_RAW
    Setting this to yes will enable a set of ioctls that provide raw
    interface to the ReiserFS tree, bypass the directories, and
    automatically remove aged files. This is an experimental feature
    designed for squid cache directories. See Documentation/filesystems/r=
eiserfs_raw.txt
    This was designed specifically to use ReiserFS as a back-end for
    the Squid. The general idea is that it is possible to bypass all
    filesystem overhead and to directly address the ReiserFS internal
    tree. This is not in the stock kernels.=20

?

Thanks.

ciao, Marc
