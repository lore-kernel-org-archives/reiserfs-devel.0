From: Wolfgang Winkler <Wolfgang.Winkler@digital-concepts.at>
Subject: Partitions corrupted - try getting original filenames
Date: Tue, 22 Apr 2003 12:32:58 +0200
Message-ID: <200304221232.58881.Wolfgang.Winkler@digital-concepts.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi!

Yesterday our server crashed and corrupted our 2 raid partitions with=20
reiserfs. When I do a reiserfsck --rebuild-sb and reiserfsck --rebuild-tree=
=20
=2DS a lot of files are deleted and the rest goes to lost+found with this=20
inode-names.=20

Is there a possibility to extract the original names of the files? Or, even=
=20
better, can I do something different to restore the partition without havin=
g=20
everything in lost+found?

Thanks wiwo
=2D-=20
Digital Concepts
Ideen-Konzepte-L=F6sungen
Wolfgang.Winkler@digital-concepts.com
www.digital-concepts.com
Mobil: +43 699 / 20 88 13 51
B=FCro: +43 732 / 77 27 27
