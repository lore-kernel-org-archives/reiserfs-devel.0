From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Errors reported with dmesg using reiser4
Date: Mon, 31 Jan 2005 23:44:19 +0300
Message-ID: <20050131204418.GB6041@backtop.namesys.com>
References: <2081.10.0.2.121.1106684934.squirrel@raven2.maya.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <2081.10.0.2.121.1106684934.squirrel@raven2.maya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: smallwood@maya.com
Cc: reiserfs-list@namesys.com

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
> reiser4[mv(28692)]: key_warning (fs/reiser4/plugin/object.c:97)[nikita-717]:
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
