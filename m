From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: Reiser4: errors AFTER fsck
Date: Sat, 5 Apr 2008 21:16:54 +0200
Message-ID: <200804052116.54592.volker.armin.hemmann@tu-clausthal.de>
References: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de> <47F74890.3080005@gmail.com> <200804051146.12025.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200804051146.12025.volker.armin.hemmann@tu-clausthal.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

On Samstag, 5. April 2008, Volker Armin Hemmann wrote:
> On Samstag, 5. April 2008, Edward Shishkin wrote:
> > Volker Armin Hemmann wrote:
> > >Hi,
> > >
> > >one essential thing I forgot:
> > >
> > >last night I switched off my computer a little bit too fast, at bo=
ot I
> > > had unclean fs. That could explain the initial corruption that po=
rtage
> > > complained about.
> >
> > Normally this shouldn't lead to data corruption.
> > So I would ask everyone to pack metadata _before_
> > --build-fs, if the last one is required after hard reset.
>
> yeah, the other two reiser4 partitions survived very well.  The prema=
ture
> shutdown was just the only unusual thing that happend that I know of =
so I
> mentioned it. But maybe the corruption happened earlier and went unno=
ticed
> for a while. /var is used in bursts ... sometimes days without me act=
ively
> accessing it and when the loggers complain, it goes on pretty much
> unnoticed for a while.
>
> I hope the meta.gz is helpfull.
>
> Gl=FCck Auf,
> Volker
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

ok, I just tried another esyncand dmesg got swamped with this:

19721] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.219723] WARNING: Target found unexpectedly
[ 2732.245795] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.245798] WARNING: Target found unexpectedly
[ 2732.245972] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.245974] WARNING: Target found unexpectedly
[ 2732.246095] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.246097] WARNING: Target found unexpectedly
[ 2732.305915] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.305917] WARNING: Target found unexpectedly
[ 2732.306529] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.306531] WARNING: Target found unexpectedly
[ 2732.306666] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.306668] WARNING: Target found unexpectedly
[ 2732.306807] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.306809] WARNING: Target found unexpectedly
[ 2732.306992] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.306994] WARNING: Target found unexpectedly
[ 2732.307143] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.307145] WARNING: Target found unexpectedly
[ 2732.307283] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.307285] WARNING: Target found unexpectedly
[ 2732.307415] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.307417] WARNING: Target found unexpectedly
[ 2732.307556] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.307558] WARNING: Target found unexpectedly
[ 2732.307762] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.307764] WARNING: Target found unexpectedly
[ 2732.307897] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.307899] WARNING: Target found unexpectedly
[ 2732.308032] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.308034] WARNING: Target found unexpectedly
[ 2732.308185] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.308187] WARNING: Target found unexpectedly
[ 2732.309090] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309092] WARNING: Target found unexpectedly
[ 2732.309227] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309229] WARNING: Target found unexpectedly
[ 2732.309359] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309361] WARNING: Target found unexpectedly
[ 2732.309500] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309502] WARNING: Target found unexpectedly
[ 2732.309649] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309651] WARNING: Target found unexpectedly
[ 2732.309799] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309801] WARNING: Target found unexpectedly
[ 2732.309941] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.309943] WARNING: Target found unexpectedly
[ 2732.310072] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.310074] WARNING: Target found unexpectedly
[ 2732.311476] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.311478] WARNING: Target found unexpectedly
[ 2732.311712] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.311714] WARNING: Target found unexpectedly
[ 2732.311855] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.311857] WARNING: Target found unexpectedly
[ 2732.312390] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.312393] WARNING: Target found unexpectedly
[ 2732.312872] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.312874] WARNING: Target found unexpectedly
[ 2732.334280] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.334282] WARNING: Target found unexpectedly
[ 2732.334981] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.334983] WARNING: Target found unexpectedly
[ 2732.335132] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.335134] WARNING: Target found unexpectedly
[ 2732.335295] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.335297] WARNING: Target found unexpectedly
[ 2732.335440] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.335442] WARNING: Target found unexpectedly
[ 2732.335596] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.335598] WARNING: Target found unexpectedly
[ 2732.335735] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.335736] WARNING: Target found unexpectedly
[ 2732.335884] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.335886] WARNING: Error for inode 248080 (-2)
[ 2732.335890] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.335891] WARNING: Failed to save sd for 248080: -2
[ 2732.335947] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.335949] WARNING: Target found unexpectedly
[ 2732.335954] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.335955] WARNING: Error for inode 248080 (-2)
[ 2732.335958] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.335960] WARNING: Failed to save sd for 248080: -2
[ 2732.335963] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.335965] WARNING: Error for inode 248080 (-2)
[ 2732.335967] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.335969] WARNING: Failed to save sd for 248080: -2
[ 2732.336054] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.336056] WARNING: Error for inode 248080 (-2)
[ 2732.336059] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.336061] WARNING: Failed to save sd for 248080: -2
[ 2732.336123] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.336125] WARNING: Error for inode 248164 (-2)
[ 2732.336128] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.336130] WARNING: Failed to save sd for 248164: -2
[ 2732.336182] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.336184] WARNING: Target found unexpectedly
[ 2732.336188] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.336190] WARNING: Error for inode 248164 (-2)
[ 2732.336192] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.336194] WARNING: Failed to save sd for 248164: -2
[ 2732.336197] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.336199] WARNING: Error for inode 248164 (-2)
[ 2732.336201] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.336203] WARNING: Failed to save sd for 248164: -2
[ 2732.336240] reiser4[rsync(7133)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2732.336242] WARNING: Error for inode 248164 (-2)
[ 2732.336245] reiser4[rsync(7133)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2732.336246] WARNING: Failed to save sd for 248164: -2
[ 2732.336364] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.336366] WARNING: Target found unexpectedly
[ 2732.455555] reiser4[rsync(7133)]: reiser4_rename_common=20
(fs/reiser4/plugin/inode_ops_rename.c:508)[nikita-2331]:
[ 2732.455558] WARNING: Target found unexpectedly
[ 2733.539147] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539150] WARNING: Error for inode 14399843 (-2)
[ 2733.539156] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539158] WARNING: Failed to save sd for 14399843: -2
[ 2733.539175] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.539177] WARNING: failed to dirty inode for 14399843: -2
[ 2733.539180] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539182] WARNING: Error for inode 14399843 (-2)
[ 2733.539185] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539186] WARNING: Failed to save sd for 14399843: -2
[ 2733.539264] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539266] WARNING: Error for inode 247169 (-2)
[ 2733.539269] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539271] WARNING: Failed to save sd for 247169: -2
[ 2733.539274] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.539275] WARNING: failed to dirty inode for 247169: -2
[ 2733.539279] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539280] WARNING: Error for inode 247169 (-2)
[ 2733.539283] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539285] WARNING: Failed to save sd for 247169: -2
[ 2733.539465] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539467] WARNING: Error for inode 247395 (-2)
[ 2733.539469] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539471] WARNING: Failed to save sd for 247395: -2
[ 2733.539474] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.539475] WARNING: failed to dirty inode for 247395: -2
[ 2733.539479] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539480] WARNING: Error for inode 247395 (-2)
[ 2733.539483] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539485] WARNING: Failed to save sd for 247395: -2
[ 2733.539968] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539970] WARNING: Error for inode 247997 (-2)
[ 2733.539973] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539975] WARNING: Failed to save sd for 247997: -2
[ 2733.539978] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.539979] WARNING: failed to dirty inode for 247997: -2
[ 2733.539983] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.539984] WARNING: Error for inode 247997 (-2)
[ 2733.539987] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.539989] WARNING: Failed to save sd for 247997: -2
[ 2733.540001] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540002] WARNING: Error for inode 248004 (-2)
[ 2733.540005] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540007] WARNING: Failed to save sd for 248004: -2
[ 2733.540009] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540011] WARNING: failed to dirty inode for 248004: -2
[ 2733.540014] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540016] WARNING: Error for inode 248004 (-2)
[ 2733.540018] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540020] WARNING: Failed to save sd for 248004: -2
[ 2733.540036] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540038] WARNING: Error for inode 248019 (-2)
[ 2733.540041] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540042] WARNING: Failed to save sd for 248019: -2
[ 2733.540045] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540046] WARNING: failed to dirty inode for 248019: -2
[ 2733.540050] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540051] WARNING: Error for inode 248019 (-2)
[ 2733.540054] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540056] WARNING: Failed to save sd for 248019: -2
[ 2733.540062] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540064] WARNING: Error for inode 248025 (-2)
[ 2733.540066] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540068] WARNING: Failed to save sd for 248025: -2
[ 2733.540071] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540072] WARNING: failed to dirty inode for 248025: -2
[ 2733.540076] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540077] WARNING: Error for inode 248025 (-2)
[ 2733.540080] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540082] WARNING: Failed to save sd for 248025: -2
[ 2733.540111] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540113] WARNING: Error for inode 248031 (-2)
[ 2733.540242] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540244] WARNING: Failed to save sd for 248031: -2
[ 2733.540393] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540395] WARNING: failed to dirty inode for 248031: -2
[ 2733.540399] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540401] WARNING: Error for inode 248031 (-2)
[ 2733.540403] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540405] WARNING: Failed to save sd for 248031: -2
[ 2733.540412] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540413] WARNING: Error for inode 248040 (-2)
[ 2733.540416] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540418] WARNING: Failed to save sd for 248040: -2
[ 2733.540420] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540421] WARNING: failed to dirty inode for 248040: -2
[ 2733.540425] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540427] WARNING: Error for inode 248040 (-2)
[ 2733.540429] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540431] WARNING: Failed to save sd for 248040: -2
[ 2733.540443] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540445] WARNING: Error for inode 248051 (-2)
[ 2733.540447] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540449] WARNING: Failed to save sd for 248051: -2
[ 2733.540451] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540453] WARNING: failed to dirty inode for 248051: -2
[ 2733.540457] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540458] WARNING: Error for inode 248051 (-2)
[ 2733.540461] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540462] WARNING: Failed to save sd for 248051: -2
[ 2733.540475] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540476] WARNING: Error for inode 248070 (-2)
[ 2733.540479] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540481] WARNING: Failed to save sd for 248070: -2
[ 2733.540483] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540484] WARNING: failed to dirty inode for 248070: -2
[ 2733.540488] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540490] WARNING: Error for inode 248070 (-2)
[ 2733.540492] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540494] WARNING: Failed to save sd for 248070: -2
[ 2733.540506] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540508] WARNING: Error for inode 248080 (-2)
[ 2733.540510] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540512] WARNING: Failed to save sd for 248080: -2
[ 2733.540514] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540516] WARNING: failed to dirty inode for 248080: -2
[ 2733.540519] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540521] WARNING: Error for inode 248080 (-2)
[ 2733.540523] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540525] WARNING: Failed to save sd for 248080: -2
[ 2733.540537] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540539] WARNING: Error for inode 248100 (-2)
[ 2733.540541] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540543] WARNING: Failed to save sd for 248100: -2
[ 2733.540545] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540547] WARNING: failed to dirty inode for 248100: -2
[ 2733.540550] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540552] WARNING: Error for inode 248100 (-2)
[ 2733.540554] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540556] WARNING: Failed to save sd for 248100: -2
[ 2733.540568] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540570] WARNING: Error for inode 248108 (-2)
[ 2733.540572] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540574] WARNING: Failed to save sd for 248108: -2
[ 2733.540577] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540578] WARNING: failed to dirty inode for 248108: -2
[ 2733.540582] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540583] WARNING: Error for inode 248108 (-2)
[ 2733.540586] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540588] WARNING: Failed to save sd for 248108: -2
[ 2733.540594] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540596] WARNING: Error for inode 248116 (-2)
[ 2733.540598] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540600] WARNING: Failed to save sd for 248116: -2
[ 2733.540603] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540604] WARNING: failed to dirty inode for 248116: -2
[ 2733.540608] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540609] WARNING: Error for inode 248116 (-2)
[ 2733.540612] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540614] WARNING: Failed to save sd for 248116: -2
[ 2733.540626] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540628] WARNING: Error for inode 248125 (-2)
[ 2733.540630] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540632] WARNING: Failed to save sd for 248125: -2
[ 2733.540634] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540636] WARNING: failed to dirty inode for 248125: -2
[ 2733.540639] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540641] WARNING: Error for inode 248125 (-2)
[ 2733.540643] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540645] WARNING: Failed to save sd for 248125: -2
[ 2733.540657] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540659] WARNING: Error for inode 248134 (-2)
[ 2733.540661] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540663] WARNING: Failed to save sd for 248134: -2
[ 2733.540665] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540667] WARNING: failed to dirty inode for 248134: -2
[ 2733.540670] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540672] WARNING: Error for inode 248134 (-2)
[ 2733.540674] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540676] WARNING: Failed to save sd for 248134: -2
[ 2733.540688] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540690] WARNING: Error for inode 248143 (-2)
[ 2733.540692] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540694] WARNING: Failed to save sd for 248143: -2
[ 2733.540696] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540698] WARNING: failed to dirty inode for 248143: -2
[ 2733.540701] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540703] WARNING: Error for inode 248143 (-2)
[ 2733.540705] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540707] WARNING: Failed to save sd for 248143: -2
[ 2733.540732] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540733] WARNING: Error for inode 248157 (-2)
[ 2733.540736] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540738] WARNING: Failed to save sd for 248157: -2
[ 2733.540740] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540741] WARNING: failed to dirty inode for 248157: -2
[ 2733.540745] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540747] WARNING: Error for inode 248157 (-2)
[ 2733.540749] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540751] WARNING: Failed to save sd for 248157: -2
[ 2733.540758] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540760] WARNING: Error for inode 248160 (-2)
[ 2733.540762] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540764] WARNING: Failed to save sd for 248160: -2
[ 2733.540766] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540768] WARNING: failed to dirty inode for 248160: -2
[ 2733.540771] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540773] WARNING: Error for inode 248160 (-2)
[ 2733.540775] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540777] WARNING: Failed to save sd for 248160: -2
[ 2733.540784] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540786] WARNING: Error for inode 248164 (-2)
[ 2733.540788] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540790] WARNING: Failed to save sd for 248164: -2
[ 2733.540792] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540794] WARNING: failed to dirty inode for 248164: -2
[ 2733.540797] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540799] WARNING: Error for inode 248164 (-2)
[ 2733.540802] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540803] WARNING: Failed to save sd for 248164: -2
[ 2733.540816] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540818] WARNING: Error for inode 248169 (-2)
[ 2733.540821] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540822] WARNING: Failed to save sd for 248169: -2
[ 2733.540825] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540826] WARNING: failed to dirty inode for 248169: -2
[ 2733.540830] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540831] WARNING: Error for inode 248169 (-2)
[ 2733.540834] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540836] WARNING: Failed to save sd for 248169: -2
[ 2733.540847] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540849] WARNING: Error for inode 248180 (-2)
[ 2733.540851] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540853] WARNING: Failed to save sd for 248180: -2
[ 2733.540855] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540857] WARNING: failed to dirty inode for 248180: -2
[ 2733.540860] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540862] WARNING: Error for inode 248180 (-2)
[ 2733.540864] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540866] WARNING: Failed to save sd for 248180: -2
[ 2733.540878] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540880] WARNING: Error for inode 248189 (-2)
[ 2733.540882] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540884] WARNING: Failed to save sd for 248189: -2
[ 2733.540887] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540888] WARNING: failed to dirty inode for 248189: -2
[ 2733.540892] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540893] WARNING: Error for inode 248189 (-2)
[ 2733.540896] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540898] WARNING: Failed to save sd for 248189: -2
[ 2733.540910] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540911] WARNING: Error for inode 248202 (-2)
[ 2733.540914] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540916] WARNING: Failed to save sd for 248202: -2
[ 2733.540918] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540919] WARNING: failed to dirty inode for 248202: -2
[ 2733.540923] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540925] WARNING: Error for inode 248202 (-2)
[ 2733.540927] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540929] WARNING: Failed to save sd for 248202: -2
[ 2733.540941] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540942] WARNING: Error for inode 248208 (-2)
[ 2733.540945] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540947] WARNING: Failed to save sd for 248208: -2
[ 2733.540949] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540951] WARNING: failed to dirty inode for 248208: -2
[ 2733.540954] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540956] WARNING: Error for inode 248208 (-2)
[ 2733.540958] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540960] WARNING: Failed to save sd for 248208: -2
[ 2733.540967] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540969] WARNING: Error for inode 248216 (-2)
[ 2733.540971] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540973] WARNING: Failed to save sd for 248216: -2
[ 2733.540975] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.540977] WARNING: failed to dirty inode for 248216: -2
[ 2733.540980] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540982] WARNING: Error for inode 248216 (-2)
[ 2733.540984] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540986] WARNING: Failed to save sd for 248216: -2
[ 2733.540993] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.540995] WARNING: Error for inode 248223 (-2)
[ 2733.540997] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.540999] WARNING: Failed to save sd for 248223: -2
[ 2733.541001] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541003] WARNING: failed to dirty inode for 248223: -2
[ 2733.541006] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541008] WARNING: Error for inode 248223 (-2)
[ 2733.541010] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541012] WARNING: Failed to save sd for 248223: -2
[ 2733.541019] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541021] WARNING: Error for inode 248230 (-2)
[ 2733.541023] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541025] WARNING: Failed to save sd for 248230: -2
[ 2733.541027] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541029] WARNING: failed to dirty inode for 248230: -2
[ 2733.541032] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541034] WARNING: Error for inode 248230 (-2)
[ 2733.541036] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541038] WARNING: Failed to save sd for 248230: -2
[ 2733.541051] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541052] WARNING: Error for inode 248240 (-2)
[ 2733.541055] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541057] WARNING: Failed to save sd for 248240: -2
[ 2733.541059] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541061] WARNING: failed to dirty inode for 248240: -2
[ 2733.541064] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541066] WARNING: Error for inode 248240 (-2)
[ 2733.541068] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541070] WARNING: Failed to save sd for 248240: -2
[ 2733.541082] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541083] WARNING: Error for inode 248249 (-2)
[ 2733.541086] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541088] WARNING: Failed to save sd for 248249: -2
[ 2733.541090] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541092] WARNING: failed to dirty inode for 248249: -2
[ 2733.541095] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541097] WARNING: Error for inode 248249 (-2)
[ 2733.541099] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541101] WARNING: Failed to save sd for 248249: -2
[ 2733.541113] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541114] WARNING: Error for inode 248259 (-2)
[ 2733.541117] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541119] WARNING: Failed to save sd for 248259: -2
[ 2733.541121] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541122] WARNING: failed to dirty inode for 248259: -2
[ 2733.541126] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541128] WARNING: Error for inode 248259 (-2)
[ 2733.541130] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541132] WARNING: Failed to save sd for 248259: -2
[ 2733.541149] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541150] WARNING: Error for inode 248273 (-2)
[ 2733.541153] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541155] WARNING: Failed to save sd for 248273: -2
[ 2733.541157] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541159] WARNING: failed to dirty inode for 248273: -2
[ 2733.541162] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541164] WARNING: Error for inode 248273 (-2)
[ 2733.541166] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541168] WARNING: Failed to save sd for 248273: -2
[ 2733.541236] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541237] WARNING: Error for inode 14399956 (-2)
[ 2733.541240] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541242] WARNING: Failed to save sd for 14399956: -2
[ 2733.541244] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541246] WARNING: failed to dirty inode for 14399956: -2
[ 2733.541249] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541251] WARNING: Error for inode 14399956 (-2)
[ 2733.541253] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541255] WARNING: Failed to save sd for 14399956: -2
[ 2733.541488] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541490] WARNING: Error for inode 14400097 (-2)
[ 2733.541592] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541594] WARNING: Failed to save sd for 14400097: -2
[ 2733.541597] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.541598] WARNING: failed to dirty inode for 14400097: -2
[ 2733.541780] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541781] WARNING: Error for inode 14400097 (-2)
[ 2733.541960] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.541962] WARNING: Failed to save sd for 14400097: -2
[ 2733.541972] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.541974] WARNING: Error for inode 14400098 (-2)
[ 2733.542111] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.542113] WARNING: Failed to save sd for 14400098: -2
[ 2733.542293] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.542294] WARNING: failed to dirty inode for 14400098: -2
[ 2733.542478] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.542479] WARNING: Error for inode 14400098 (-2)
[ 2733.542482] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.542484] WARNING: Failed to save sd for 14400098: -2
[ 2733.542491] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.542492] WARNING: Error for inode 14400099 (-2)
[ 2733.542495] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.542497] WARNING: Failed to save sd for 14400099: -2
[ 2733.542651] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.542653] WARNING: failed to dirty inode for 14400099: -2
[ 2733.542836] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.542837] WARNING: Error for inode 14400099 (-2)
[ 2733.542840] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.542842] WARNING: Failed to save sd for 14400099: -2
[ 2733.543162] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543163] WARNING: Error for inode 14400101 (-2)
[ 2733.543222] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543224] WARNING: Failed to save sd for 14400101: -2
[ 2733.543227] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543229] WARNING: failed to dirty inode for 14400101: -2
[ 2733.543347] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543349] WARNING: Error for inode 14400101 (-2)
[ 2733.543529] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543531] WARNING: Failed to save sd for 14400101: -2
[ 2733.543543] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543544] WARNING: Error for inode 14400103 (-2)
[ 2733.543547] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543549] WARNING: Failed to save sd for 14400103: -2
[ 2733.543552] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543553] WARNING: failed to dirty inode for 14400103: -2
[ 2733.543610] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543612] WARNING: Error for inode 14400103 (-2)
[ 2733.543615] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543617] WARNING: Failed to save sd for 14400103: -2
[ 2733.543636] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543638] WARNING: Error for inode 14400105 (-2)
[ 2733.543641] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543643] WARNING: Failed to save sd for 14400105: -2
[ 2733.543682] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543683] WARNING: failed to dirty inode for 14400105: -2
[ 2733.543698] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543699] WARNING: Error for inode 14400105 (-2)
[ 2733.543702] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543704] WARNING: Failed to save sd for 14400105: -2
[ 2733.543726] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543727] WARNING: Error for inode 14400107 (-2)
[ 2733.543730] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543732] WARNING: Failed to save sd for 14400107: -2
[ 2733.543734] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543736] WARNING: failed to dirty inode for 14400107: -2
[ 2733.543749] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543751] WARNING: Error for inode 14400107 (-2)
[ 2733.543754] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543755] WARNING: Failed to save sd for 14400107: -2
[ 2733.543782] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543784] WARNING: Error for inode 14400109 (-2)
[ 2733.543786] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543788] WARNING: Failed to save sd for 14400109: -2
[ 2733.543791] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543792] WARNING: failed to dirty inode for 14400109: -2
[ 2733.543806] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543807] WARNING: Error for inode 14400109 (-2)
[ 2733.543810] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543812] WARNING: Failed to save sd for 14400109: -2
[ 2733.543832] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543834] WARNING: Error for inode 14400111 (-2)
[ 2733.543837] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543839] WARNING: Failed to save sd for 14400111: -2
[ 2733.543841] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543843] WARNING: failed to dirty inode for 14400111: -2
[ 2733.543856] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543857] WARNING: Error for inode 14400111 (-2)
[ 2733.543860] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543862] WARNING: Failed to save sd for 14400111: -2
[ 2733.543882] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543884] WARNING: Error for inode 14400113 (-2)
[ 2733.543886] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543888] WARNING: Failed to save sd for 14400113: -2
[ 2733.543891] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543892] WARNING: failed to dirty inode for 14400113: -2
[ 2733.543905] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543907] WARNING: Error for inode 14400113 (-2)
[ 2733.543909] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543911] WARNING: Failed to save sd for 14400113: -2
[ 2733.543925] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543927] WARNING: Error for inode 14400114 (-2)
[ 2733.543930] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543932] WARNING: Failed to save sd for 14400114: -2
[ 2733.543934] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543936] WARNING: failed to dirty inode for 14400114: -2
[ 2733.543948] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543950] WARNING: Error for inode 14400114 (-2)
[ 2733.543953] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543955] WARNING: Failed to save sd for 14400114: -2
[ 2733.543981] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.543982] WARNING: Error for inode 14400116 (-2)
[ 2733.543985] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.543987] WARNING: Failed to save sd for 14400116: -2
[ 2733.543989] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.543991] WARNING: failed to dirty inode for 14400116: -2
[ 2733.544004] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544005] WARNING: Error for inode 14400116 (-2)
[ 2733.544008] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544010] WARNING: Failed to save sd for 14400116: -2
[ 2733.544030] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544032] WARNING: Error for inode 14400118 (-2)
[ 2733.544035] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544036] WARNING: Failed to save sd for 14400118: -2
[ 2733.544039] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544040] WARNING: failed to dirty inode for 14400118: -2
[ 2733.544053] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544055] WARNING: Error for inode 14400118 (-2)
[ 2733.544058] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544060] WARNING: Failed to save sd for 14400118: -2
[ 2733.544085] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544087] WARNING: Error for inode 14400120 (-2)
[ 2733.544090] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544092] WARNING: Failed to save sd for 14400120: -2
[ 2733.544094] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544096] WARNING: failed to dirty inode for 14400120: -2
[ 2733.544109] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544111] WARNING: Error for inode 14400120 (-2)
[ 2733.544113] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544115] WARNING: Failed to save sd for 14400120: -2
[ 2733.544135] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544137] WARNING: Error for inode 14400122 (-2)
[ 2733.544139] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544141] WARNING: Failed to save sd for 14400122: -2
[ 2733.544144] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544145] WARNING: failed to dirty inode for 14400122: -2
[ 2733.544158] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544159] WARNING: Error for inode 14400122 (-2)
[ 2733.544162] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544164] WARNING: Failed to save sd for 14400122: -2
[ 2733.544193] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544195] WARNING: Error for inode 14400124 (-2)
[ 2733.544198] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544200] WARNING: Failed to save sd for 14400124: -2
[ 2733.544202] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544203] WARNING: failed to dirty inode for 14400124: -2
[ 2733.544217] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544218] WARNING: Error for inode 14400124 (-2)
[ 2733.544221] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544223] WARNING: Failed to save sd for 14400124: -2
[ 2733.544243] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544245] WARNING: Error for inode 14400125 (-2)
[ 2733.544248] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544249] WARNING: Failed to save sd for 14400125: -2
[ 2733.544252] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544253] WARNING: failed to dirty inode for 14400125: -2
[ 2733.544266] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544268] WARNING: Error for inode 14400125 (-2)
[ 2733.544270] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544272] WARNING: Failed to save sd for 14400125: -2
[ 2733.544287] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544288] WARNING: Error for inode 14400126 (-2)
[ 2733.544291] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544293] WARNING: Failed to save sd for 14400126: -2
[ 2733.544295] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544297] WARNING: failed to dirty inode for 14400126: -2
[ 2733.544311] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544313] WARNING: Error for inode 14400126 (-2)
[ 2733.544316] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544318] WARNING: Failed to save sd for 14400126: -2
[ 2733.544338] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544339] WARNING: Error for inode 14400128 (-2)
[ 2733.544342] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544344] WARNING: Failed to save sd for 14400128: -2
[ 2733.544346] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544348] WARNING: failed to dirty inode for 14400128: -2
[ 2733.544361] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544362] WARNING: Error for inode 14400128 (-2)
[ 2733.544365] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544367] WARNING: Failed to save sd for 14400128: -2
[ 2733.544393] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544394] WARNING: Error for inode 14400130 (-2)
[ 2733.544397] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544399] WARNING: Failed to save sd for 14400130: -2
[ 2733.544401] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544403] WARNING: failed to dirty inode for 14400130: -2
[ 2733.544416] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544418] WARNING: Error for inode 14400130 (-2)
[ 2733.544421] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544422] WARNING: Failed to save sd for 14400130: -2
[ 2733.544443] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544445] WARNING: Error for inode 14400132 (-2)
[ 2733.544448] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544450] WARNING: Failed to save sd for 14400132: -2
[ 2733.544452] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544454] WARNING: failed to dirty inode for 14400132: -2
[ 2733.544466] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544468] WARNING: Error for inode 14400132 (-2)
[ 2733.544471] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544472] WARNING: Failed to save sd for 14400132: -2
[ 2733.544492] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544494] WARNING: Error for inode 14400134 (-2)
[ 2733.544497] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544498] WARNING: Failed to save sd for 14400134: -2
[ 2733.544501] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544502] WARNING: failed to dirty inode for 14400134: -2
[ 2733.544515] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544517] WARNING: Error for inode 14400134 (-2)
[ 2733.544520] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544522] WARNING: Failed to save sd for 14400134: -2
[ 2733.544541] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544543] WARNING: Error for inode 14400136 (-2)
[ 2733.544545] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544547] WARNING: Failed to save sd for 14400136: -2
[ 2733.544550] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544551] WARNING: failed to dirty inode for 14400136: -2
[ 2733.544564] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544566] WARNING: Error for inode 14400136 (-2)
[ 2733.544568] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544570] WARNING: Failed to save sd for 14400136: -2
[ 2733.544584] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544586] WARNING: Error for inode 14400137 (-2)
[ 2733.544589] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544591] WARNING: Failed to save sd for 14400137: -2
[ 2733.544593] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544595] WARNING: failed to dirty inode for 14400137: -2
[ 2733.544607] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544609] WARNING: Error for inode 14400137 (-2)
[ 2733.544612] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544614] WARNING: Failed to save sd for 14400137: -2
[ 2733.544633] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544635] WARNING: Error for inode 14400139 (-2)
[ 2733.544637] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544639] WARNING: Failed to save sd for 14400139: -2
[ 2733.544642] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544643] WARNING: failed to dirty inode for 14400139: -2
[ 2733.544656] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544657] WARNING: Error for inode 14400139 (-2)
[ 2733.544660] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544662] WARNING: Failed to save sd for 14400139: -2
[ 2733.544688] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544690] WARNING: Error for inode 14400141 (-2)
[ 2733.544693] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544695] WARNING: Failed to save sd for 14400141: -2
[ 2733.544697] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544698] WARNING: failed to dirty inode for 14400141: -2
[ 2733.544712] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544713] WARNING: Error for inode 14400141 (-2)
[ 2733.544716] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544718] WARNING: Failed to save sd for 14400141: -2
[ 2733.544738] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544740] WARNING: Error for inode 14400143 (-2)
[ 2733.544743] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544744] WARNING: Failed to save sd for 14400143: -2
[ 2733.544747] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544748] WARNING: failed to dirty inode for 14400143: -2
[ 2733.544761] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544763] WARNING: Error for inode 14400143 (-2)
[ 2733.544765] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544767] WARNING: Failed to save sd for 14400143: -2
[ 2733.544787] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544789] WARNING: Error for inode 14400145 (-2)
[ 2733.544792] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544794] WARNING: Failed to save sd for 14400145: -2
[ 2733.544796] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544797] WARNING: failed to dirty inode for 14400145: -2
[ 2733.544810] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544812] WARNING: Error for inode 14400145 (-2)
[ 2733.544815] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544817] WARNING: Failed to save sd for 14400145: -2
[ 2733.544831] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544833] WARNING: Error for inode 14400146 (-2)
[ 2733.544836] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544837] WARNING: Failed to save sd for 14400146: -2
[ 2733.544840] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544841] WARNING: failed to dirty inode for 14400146: -2
[ 2733.544854] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544856] WARNING: Error for inode 14400146 (-2)
[ 2733.544859] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544860] WARNING: Failed to save sd for 14400146: -2
[ 2733.544886] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544888] WARNING: Error for inode 14400148 (-2)
[ 2733.544891] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544893] WARNING: Failed to save sd for 14400148: -2
[ 2733.544895] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544897] WARNING: failed to dirty inode for 14400148: -2
[ 2733.544910] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544912] WARNING: Error for inode 14400148 (-2)
[ 2733.544915] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544917] WARNING: Failed to save sd for 14400148: -2
[ 2733.544936] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544938] WARNING: Error for inode 14400150 (-2)
[ 2733.544941] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544943] WARNING: Failed to save sd for 14400150: -2
[ 2733.544945] reiser4[rsync(7127)]: reiser4_dirty_inode=20
(fs/reiser4/super_ops.c:179)[]:
[ 2733.544947] WARNING: failed to dirty inode for 14400150: -2
[ 2733.544959] reiser4[rsync(7127)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[ 2733.544961] WARNING: Error for inode 14400150 (-2)
[ 2733.544964] reiser4[rsync(7127)]: write_sd_by_inode_common=20
(fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[ 2733.544966] WARNING: Failed to save sd for 14400150: -2

the command&output was:
esync
 * Importing old portage tree
 * Doing 'EMERGE_DEFAULT_OPTS=3D"" /usr/bin/emerge --sync' now

 * Doing 'eupdatedb' now

Traceback (most recent call last):
  File "/usr/sbin/eupdatedb", line 119, in <module>
    ebuilds =3D portage.portdb.cp_all()
  File "/usr/lib64/portage/pym/portage.py", line 7272, in cp_all
    for y in listdir(oroot+"/"+x, EmptyOnError=3D1, ignorecvs=3D1, dirs=
only=3D1):
  File "/usr/lib64/portage/pym/portage.py", line 290, in listdir
    list, ftype =3D cacheddir(mypath, ignorecvs, ignorelist, EmptyOnErr=
or,=20
followSymlinks)
  File "/usr/lib64/portage/pym/portage.py", line 226, in cacheddir
    list =3D os.listdir(mypath)
OSError: [Errno 5] Input/output error: '/var/portage/net-voip'

 * Error: eupdatedb failed


I uploaded at rapidshare:
the packed metadata before fsck: meta2_bb_before_fsck.gz
the packed metadata after first fsck run without any options (beside -L=
=20
and -y): meta2_bb_after_fsck.gz
the packed metadata after fsck with --build-fs:=20
meta2_bb_after_fsck_build_fs.gz

the 'bb' in the filename because busybox was the shell I used.

you can find everything, including two logfiles,  here:
http://rapidshare.com/users/M56DNW

But there are good news:

this time fsck really fixed the corruption!
I have a huge amount of files in l&f but accessing them does not create=
 any=20
errors anymore! The old ones seem to be ok too!

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
