From: "Rodolfo Pilas" <rodolfo@pilas.biz>
Subject: How to access data
Date: Mon, 25 Aug 2003 21:31:05 -0300 (UYT)
Message-ID: <20030826003105.A60BCC6CA@mail.pilas.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15410-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Errors-To: "Rodolfo Pilas" <rodolfo@pilas.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


My notebook has batery problems and its lost power.  After a power down
the HD remains with read block problems, with demage the filesystem.   I
have not found how to mark bad block, for this reason I try to
rebuild-tree to move data from bad block to another good place.

I have this problem:
----
hda: read_intr: status=3D0x5b { DriveRead SeekComplete DataRequest Index
Error }
hda: read_intr: error=3D0x40 { UncorrectableError }, LBAsec=3D767876510,
sector=3D723912
end_request: I/O error, dev 03:06 (hda), sector 723912

The reiserfsck says:

The problem has occurred looks like a hardware problem...... blah, blah...

bread: Cannot read the block (90488): (Input/output error).
Aborted
-----

Of course, I understand that I would mkfs again, but I would like to have
a backup of remain data first.

I use RIP http://www.tux.org/pub/people/kent-robotti/looplinux/rip/ with
reiserfsprogs 3.6.8 to try to access my filesystem.

Is there are any way to ignore block 90488 ?    (to access to the rest of
my data files).  I can not mount up to end rebuild-tree option.


Rodolfo Pilas <rodolfo@pilas.biz>
