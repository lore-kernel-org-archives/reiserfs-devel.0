From: Erwin Riegler <riegler@hep.itp.tuwien.ac.at>
Subject: bug in reiser4
Date: Tue, 29 Mar 2005 13:55:15 +0200 (CEST)
Message-ID: <Pine.LNX.4.21.0503291350290.5605-100000@hep.itp.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-23720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: reiserfs-list@namesys.com


hi,
i have been using reiser4 for five months without any problems.
but suddenly i get strange error messages on the screen when=20
i try to halt the machine:

# halt


=2E..

reiser4[pdflush(131)]: jnode_lock_parent_coord
(fs/reiser4/flush.c:3095)[nikita-3178]:

=2E..

this message is repeating all the time and the system is hanging in a
never ending loop.

system:

debian sid
kernel: 2.6.10-cko3

best,
erwin=20


------------------------------------------------------------
[work address]                             [private address]
Erwin Riegler                                  Erwin Riegler
Max Planck Institute for                A=DFmayergasse 23/5/41
Mathematics in the Sciences                    A-1120 Vienna
Inselstrasse 22
D-04103 Leipzig
office: +49-341-995950-850             home: +43-660-2146904
email:  riegler@hep.itp.tuwien.ac.at                =20
web:    http://www.mis.mpg.de
------------------------------------------------------------

