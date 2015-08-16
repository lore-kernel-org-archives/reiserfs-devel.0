From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 development model and compatibility
Date: Sun, 16 Aug 2015 15:53:03 +0200
Message-ID: <55D095BF.8040403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=JjWw2jrQJA8gZHoh1+BP8/X2aLyglXiaGxSpFNHjUAg=;
        b=J1aygM38i2f8QH3ftJCg9AMQ0fJf1TGmTesNWyrDKcTBdI3G624fEpfE9u0WzQJzkh
         M3r7DWDNNgcMhMgMXLtZwFn63hJKcGgzsKxluyr7ZxlRdfAMqSJN+KspeHuguA7eku2V
         SpnHLCp/XOALPIXCD1ySsh0pxhDpjXPk2n3Z2PO8AborVPP4uXetpZ+FtrjY4vwvESd3
         gSC4Uphi/w+m+s5nzMerH8pJkN8TOcXiHBbTcMoaG8rjicTpTx56dL2qcZWBriCxCP8J
         Z0vfWitR4dcLEUgKAvUSRN1JqXDC1z5SWxU/0p2ji0l7dE/IQg44TMkm4+dkeAWHQqC1
         X2FA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


                 1. Reiser4 development model


Here we discuss things needed to keep a track of compatibility,
so we don't consider upgrades, which are fully backward and forward
compatible (like adding discard/TRIM support).

Other upgrades of reiser4 kernel module (reiser4progs) always look
like adding a plugin or a set of plugins of existing, or new
interfaces. Such upgrades are always backward compatible (by
definition).

With every such upgrade developer has to increment plugin library
version number of both, reiser4 kernel module and reiser4progs.
See definition of the macro PLUGIN_LIBRARY_VERSION in reiser4
kernel module and reiser4progs.


                2. Software Format Release Numbers


Any reiser4 kernel module (reiser4progs package) has a software format
release number (SFRN) 4.X.Y, where X and Y are major and minor SFRN
respectively.

Major SFRN of reiser4 module (reiser4progs) is defined as the maximal
serial number of supported disk format plugin (see definition of the
struct disk_format_plugin).

Minor SFRN of reiser4 module (reiser4progs) is defined as version
number of the plugin library.

SFRN of reiser4 kernel module is reported by kernel (look for the
string "Loading Reiser4 (format release: 4.X.Y)" in kernel messages.

SFRN of reiser4progs is reported by every utility provided by this
package when specifying option -V (Look for the string "Format release
4.X.Y").

Don't confuse SFRN and the version number of reiser4progs package!
The last one takes into account all software changes (including fully
compatible ones).


                 3. Compatibility of software upgrades


Every upgrade of reiser4 kernel module (reiser4progs) performed in
accordance with the development model (section 1) is automatically
backward compatible.
"Major" upgrades (4.X.Y) -> (4.X+1.Y) are fully forward incompatible.
"Minor" upgrades (4.X.Y) -> (4.X.Y+1) are partially forward compatible.


                   4. Disk format version numbers


Any reiser4 partition has a disk format versions number (DFVN) 4.A.B,
where A and B are respectively major and minor DFVN.

Major DFVN is defined as the serial number of disk format plugin
specified when formatting the partition. Major DFVN never changes.

Minor DFVN is defined as the minimal version of the plugin library
fully compatible with this partition. Initially every partition gets
minor DFVN equal to minor SFRN of the mkfs.reiser4 utility when
formatting the partition. Further minor DFVN can be upgraded.

Any partition 4.A.B can be correctly handled only by reiser4progs 4.U.V,
where A <= U and B <= V. Otherwise, reiser4progs will refuse to work
with such partition (user will be suggested to upgrade reiser4progs).

Any partition 4.A.B can be fully mounted only by kernel module 4.U.B,
where A <= U.

If A > U, then mount will fail with a kernel warning about forward
incompatibility and a suggestion to upgrade the kernel.

When mounting a partition 4.A.B by kernel module 4.U.V, where  A <= U,
B != V, then 2 scenarios are possible:

If B > V, then mount will succeed, but kernel will warn about partial
forward compatibility (it means that not all disk objects will be
accessible in that mount session).

If B < V, then mount will succeed. Kernel will upgrade DFVN in the
primary superblock with the suggestion to upgrade DFVN in the
superblock replicas (backup blocks) by running fsck.reiser4  --fix.

DFVN can be fully upgraded by any reiser4.fsck utility of proper SFRN.
Reiser4 kernel module upgrades DFVN only in the primary superblock.
Downgrades of DFVN are not supported/planned.

DFVN is reported by kernel at mount time (look for the string:
"reiser4: found disk format 4.A.B"). DFVN is also reported by
debugfs.reiser4 utility in default mode.

