From: "Nicolas Smallwood" <smallwood@maya.com>
Subject: RE: Errors reported with dmesg using reiser4
Date: Tue, 1 Feb 2005 11:55:45 -0500
Message-ID: <CMEFJOIJPCAMFCEKIEOECEMJCFAA.smallwood@maya.com>
References: <CMEFJOIJPCAMFCEKIEOEIEMICFAA.smallwood@maya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <CMEFJOIJPCAMFCEKIEOEIEMICFAA.smallwood@maya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser <reiserfs-list@namesys.com>

The fsck.reiser4 check reported one fatal error in the superblock

Running fsck.reiser4 --build-sb as I type this.

Nicolas Smallwood



-----Original Message-----
From: Alex Zarochentsev [mailto:zam@namesys.com]
Sent: Monday, January 31, 2005 3:44 PM
To: smallwood@maya.com
Cc: reiserfs-list@namesys.com
Subject: Re: Errors reported with dmesg using reiser4


Hello,

On Tue, Jan 25, 2005 at 03:28:54PM -0500, smallwood@maya.com wrote:
> Hello, for the record, this is from a system running the following specs:
>
> Gentoo Linux
> 2.6.10-gentoo-r6 patched with reiser4-for-2.6.10-1
> 3ware 7000 series card with 4 SATA 250GB Western Digitial Drives with no
> raid configured.
>
> I am running a test pushing millions of directories onto one of the drives
> using a UUID as the directory name.  These all reside in the base
> directory of the filesystem.
>
> The directories are now being propogated by two python scripts creating
> random data inside these folders on two of the other drives.  When about
> 1.5gb has collected, they begin moving the folders onto the main drive.
>
> This latest test was started last Thursday, with the drive being about 34
> GBs full of data from related testing.
>
> Since then, the drive has filled to 92GB, but at some point, I discovered
> the following error:
>
> reiser4[mv(28692)]: key_warning
(fs/reiser4/plugin/object.c:97)[nikita-717]:
> WARNING: Error for inode 215673251 (-2)
> reiser4[mv(28692)]: write_sd_by_inode_common
> (fs/reiser4/plugin/object.c:480[nikita-2221]:
> WARNING: Failed to save sd for 215673251: -2
>
> These messages are then repeated nine times.
>
> Any suggestions on further checks I can make?

can you run fsck.reiser4 --check on that drive?

>
> Thank You,
>
> Nicolas Smallwood
> smallwood@maya.com

--
Alex.

