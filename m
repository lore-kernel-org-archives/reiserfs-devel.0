From: grossnik.mailinglists@hispeed.ch
Subject: Re: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 12:51:09 +0200
Message-ID: <200609081051.k88Ap9Yn031997@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: Grossniklaus Mailinglists <grossnik.mailinglists@hispeed.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: reiserfs-list@namesys.com

Hi Vladimir=20

>please run=20
>for i in `cat /root/hda3.bad`; do debugreiserfs -1 $i /dev/hda3 > /dev/nul=
l;=20
>done

So many Thx for very fast response.
Here's the output:


debugreiserfs 3.6.19 (2003 www.namesys.com)

4602176 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602179 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602180 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602181 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602182 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602183 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602185 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602186 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602187 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602188 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602189 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602190 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602191 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602193 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602194 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602195 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602196 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602197 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602198 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602199 is used in ondisk bitmap
debugreiserfs 3.6.19 (2003 www.namesys.com)

4602201 is used in ondisk bitmap




-----------------------------------------------
syslog:
...
Sep  8 12:46:12 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekC=
omplete DataRequest Error }
Sep  8 12:46:12 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableErro=
r }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941703
Sep  8 12:46:12 kim kernel: ide: failed opcode was: unknown
Sep  8 12:46:12 kim kernel: end_request: I/O error, dev hda, sector 1149417=
03
Sep  8 12:46:12 kim kernel: Buffer I/O error on device hda3, logical block =
4602201
Sep  8 12:46:13 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekC=
omplete DataRequest Error }
Sep  8 12:46:13 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableErro=
r }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941703
Sep  8 12:46:13 kim kernel: ide: failed opcode was: unknown
Sep  8 12:46:13 kim kernel: end_request: I/O error, dev hda, sector 1149417=
03
Sep  8 12:46:13 kim kernel: Buffer I/O error on device hda3, logical block =
4602201




Kind Regards
Bruno
