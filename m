From: "Matthew Allen" <fret@memecode.com>
Subject: Virtual volumes...
Date: Thu, 21 Aug 2003 16:25:13 +1000
Message-ID: <7A9LQ9.1211187279E4T3F2@cisra.canon.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

FYI I've quickly read the FAQ and done a search of the mailing list=2E=2E=2E=
 and not found any mention of using ReiserFS in a virtual volume (or volum=
e in a file)=2E So excuse me if the information is somewhere=2E=2E=2E

For many months I've been looking for a way to store information for a MUA=
, and it seems to me that the obvious solution is to either use a database=
 or use a filesystem=2E

Personally I like the features of reiserfs (esp the uncomming v4) and woul=
d much like to be able to use it to read/write a volume in a file=2E I kno=
w it's probably going to be hard to resize the volume, as most file system=
s are written to fill fixed size partitions on real hardware=2E

Finally another benifit of have a volume in a file is that Reiser can be u=
sing by an OS like Windows that doesn't have plugin file systems=2E For in=
stance my mail client runs on Linux and Windows, using a monolithic mail s=
tore file (my own [lame] format) so that you could read/write mail from ei=
ther OS in a dual boot environment=2E It works but it's slow and prone to =
corruption, hence I'm investigating a proper transactional file system ;)

Raw speed is not so much and issue as portability, crash recovery and flex=
ibility=2E

So I have a few questions:

1) Is it possible to redirect ReiserFS to use a file instead of a physical=
 disk? (As far as I'm aware LVM doesn't do that=2E=2E=2E)
2) How quickly can ReiserFS resize a partition?

Ideally a file system would scale transparently to any size=2E But I don't=
 know enough about the disk format to know if thats possible=2E Maybe with=
 some redesign it could quickly resize a volume to better support being us=
ed in a file=2E Obviously you don't want the virtual volume file to take u=
p stacks of unused space=2E Even if the granularity of resizing was pretty=
 course I wouldn't mind=2E

regards
--
Matthew Allen
(fret@memecode=2Ecom) (http://www=2Ememecode=2Ecom)

