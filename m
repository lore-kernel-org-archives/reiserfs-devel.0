From: johnrobertbanks@fastmail.fm
Subject: Re: Reiser4. BEST FILESYSTEM EVER? I need help.
Date: Thu, 05 Apr 2007 17:05:21 -0700
Message-ID: <1175817921.18400.1183285196@webmail.messagingengine.com>
References: <46157B5B.5000602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1767423AbXDFAFY@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46157B5B.5000602@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hi Ignatich,

After seeing the following benchmarks at=20

http://linuxhelp.150m.com/resources/fs-benchmarks.htm and
http://m.domaindlx.com/LinuxHelp/resources/fs-benchmarks.htm

The Reiser4 benchmarks are so good, I have decided to try the Reiser4
filesystem.

=2E-------------------------.
| FILESYSTEM | TIME |DISK |
| TYPE       |(secs)|USAGE|
=2E-------------------------.
|REISER4 lzo | 1938 | 278 |
|REISER4 gzip| 2295 | 213 |
|REISER4     | 3462 | 692 |
|EXT2        | 4092 | 816 |
|JFS         | 4225 | 806 |
|EXT4        | 4408 | 816 |
|EXT3        | 4421 | 816 |
|XFS         | 4625 | 779 |
|REISER3     | 6178 | 793 |
|FAT32       |12342 | 988 |
|NTFS-3g     |10414 | 772 |
=2E-------------------------.

Column one measures the time taken to complete the bonnie++ benchmarkin=
g
test (run with the parameters bonnie++ -n128:128k:0)

Column two, Disk Usage: measures the amount of disk used to store 655MB
of raw data (which was 3 different copies of the Linux kernel sources).

Anyway, I have patched the 2.6.20 kernel and have a partition formatted
with Reiser4.

However, I am having trouble getting LILO or GRUB working (with
Reiser4).

Could you guys who know all about this, help me, or point me to some
help.

Thanks a lot, John.


On Fri, 06 Apr 2007 02:42:35 +0400, "Ignatich" <ignatich@gmail.com>
said:
> While trying to find the cause of problems with reiser4 in recent=20
> kernels I came across this.
>=20
> Incomplete write handling seem to be missing from reiser4_write_exten=
t()=20
> thanks to reiser4-temp-fix.patch. Strangely, there is a patch by Edwa=
rd=20
> Shishkin that should address that issue, but it is missing from -mm=20
> tree. Please check.
>=20
>     Max
>=20
--=20
 =20
  johnrobertbanks@fastmail.fm

--=20
http://www.fastmail.fm - And now for something completely different=85
