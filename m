From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4+2.6.38.6 broken?
Date: Mon, 16 May 2011 22:16:11 +0200
Message-ID: <4DD1860B.8010505@gmail.com>
References: <37304792.ap5uy0yJeJ@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <37304792.ap5uy0yJeJ@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/16/2011 09:55 PM, Volker Armin Hemmann wrote:
> Hi,
>
> I have several r4 partitions, all with cryptcompress.
>
> I tried 2.6.38.x6 a few hours ago - after 3h I looked at dmesg and it=
 was
> swamped with error messages and tracebacks. Sadly I tried to run fsck=
 before
> saving dmesg - and the box froze completely.
>
> I am now back to 2.6.36.4. fsck is running on one of the partitions. =
Meanwhile
> I see tons of this:
>
> [  153.379751] reiser4[kuiserver(2649)]: reiser4_inflate_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
> [  153.379756] WARNING: Inode 2975012: disk cluster 27 looks corrupte=
d
> [  163.301372] reiser4[kuiserver(2669)]: dc_check_checksum
> (fs/reiser4/plugin/file/cryptcompress.c:969)[edward-156]:
> [  163.301374] WARNING: Bad disk cluster checksum 799645291, (should =
be
> 546616041) Fsck?
> [  163.301375]
> [  163.301378] reiser4[kuiserver(2669)]: reiser4_inflate_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
> [  163.301379] WARNING: Inode 2975012: disk cluster 27 looks corrupte=
d
> [  384.552095] chrome_sandbox (2789): /proc/2786/oom_adj is deprecate=
d, please
> use /proc/2786/oom_score_adj instead.
> [  666.688727] reiser4[ent:md1!(1383)]: dc_check_checksum
> (fs/reiser4/plugin/file/cryptcompress.c:969)[edward-156]:
> [  666.688732] WARNING: Bad disk cluster checksum 1953788261, (should=
 be
> 1187109005) Fsck?
> [  666.688736]
> [  666.688748] reiser4[ent:md1!(1383)]: reiser4_inflate_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
> [  666.688752] WARNING: Inode 2975012: disk cluster 21 looks corrupte=
d
> [  666.688762] reiser4[ent:md1!(1383)]: read_some_cluster_pages
> (fs/reiser4/plugin/file/cryptcompress.c:2328)[edward-219]:
> [  666.688767] WARNING: do_readpage_ctail failed
> [  666.688780] reiser4[ent:md1!(1383)]: capture_anon_pages
> (fs/reiser4/plugin/file/cryptcompress.c:3518)[edward-1077]:
> [  666.688784] WARNING: Capture failed (inode 2975012, result=3D-5, c=
aptured=3D16)
> [  666.688788]
> [  903.921155] reiser4[konqueror(3060)]: key_warning
> (fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
> [  903.921160] WARNING: Error for inode 5984667 (-2)
>
> and
>
> [ 1604.433805] reiser4[konqueror(3181)]: key_warning
> (fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
> [ 1604.433810] WARNING: Error for inode 4743057 (-2)
> [ 1949.251123] reiser4[konqueror(3248)]: key_warning
> (fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
> [ 1949.251125] WARNING: Error for inode 4743057 (-2)
>
> known problem with 2.6.38.X?

Yes, this is known and old problem.
This is not specific to compression.

Edward.

>
> Gl=FCck Auf,
> Volker
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
