From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: reiser4+2.6.38.6 broken?
Date: Mon, 16 May 2011 21:55:59 +0200
Message-ID: <37304792.ap5uy0yJeJ@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:from:to:subject:date:message-id:user-agent
         :mime-version:content-transfer-encoding:content-type;
        bh=nzDfAuWexHgekn7DKti4jKGnOgU/3COjjpfqQuEu0gE=;
        b=dk7ksEqriAixIvv/h/RXRdvSOR2leCC2tYVEnA+ySHFY4fGMo+46JS1Ql/bwLWdTV0
         Kpl6XmuPJP+xc3WiLibUJJoFG7mmi++F9jY2H/EzlQfPiL88k6mULFvRMeLpqh/9S5Of
         f2hFkPxnI7myebdLRP/c6Q94ymMx37Uq2nPaI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

Hi,

I have several r4 partitions, all with cryptcompress.

I tried 2.6.38.x6 a few hours ago - after 3h I looked at dmesg and it w=
as=20
swamped with error messages and tracebacks. Sadly I tried to run fsck b=
efore=20
saving dmesg - and the box froze completely.

I am now back to 2.6.36.4. fsck is running on one of the partitions. Me=
anwhile=20
I see tons of this:

[  153.379751] reiser4[kuiserver(2649)]: reiser4_inflate_cluster=20
(fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
[  153.379756] WARNING: Inode 2975012: disk cluster 27 looks corrupted
[  163.301372] reiser4[kuiserver(2669)]: dc_check_checksum=20
(fs/reiser4/plugin/file/cryptcompress.c:969)[edward-156]:
[  163.301374] WARNING: Bad disk cluster checksum 799645291, (should be=
=20
546616041) Fsck?
[  163.301375]=20
[  163.301378] reiser4[kuiserver(2669)]: reiser4_inflate_cluster=20
(fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
[  163.301379] WARNING: Inode 2975012: disk cluster 27 looks corrupted
[  384.552095] chrome_sandbox (2789): /proc/2786/oom_adj is deprecated,=
 please=20
use /proc/2786/oom_score_adj instead.
[  666.688727] reiser4[ent:md1!(1383)]: dc_check_checksum=20
(fs/reiser4/plugin/file/cryptcompress.c:969)[edward-156]:
[  666.688732] WARNING: Bad disk cluster checksum 1953788261, (should b=
e=20
1187109005) Fsck?
[  666.688736]=20
[  666.688748] reiser4[ent:md1!(1383)]: reiser4_inflate_cluster=20
(fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
[  666.688752] WARNING: Inode 2975012: disk cluster 21 looks corrupted
[  666.688762] reiser4[ent:md1!(1383)]: read_some_cluster_pages=20
(fs/reiser4/plugin/file/cryptcompress.c:2328)[edward-219]:
[  666.688767] WARNING: do_readpage_ctail failed
[  666.688780] reiser4[ent:md1!(1383)]: capture_anon_pages=20
(fs/reiser4/plugin/file/cryptcompress.c:3518)[edward-1077]:
[  666.688784] WARNING: Capture failed (inode 2975012, result=3D-5, cap=
tured=3D16)
[  666.688788]=20
[  903.921155] reiser4[konqueror(3060)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  903.921160] WARNING: Error for inode 5984667 (-2)

and

[ 1604.433805] reiser4[konqueror(3181)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 1604.433810] WARNING: Error for inode 4743057 (-2)
[ 1949.251123] reiser4[konqueror(3248)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 1949.251125] WARNING: Error for inode 4743057 (-2)

known problem with 2.6.38.X?

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
