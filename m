From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 bug
Date: Fri, 4 Mar 2005 16:48:43 +0300
Message-ID: <20050304134843.GK6393@backtop.namesys.com>
References: <422220B3.8000800@cpc.wmin.ac.uk>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <422220B3.8000800@cpc.wmin.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szabolcs Illes <illes@cpc.wmin.ac.uk>
Cc: reiserfs-list@namesys.com

Hello,

On Sun, Feb 27, 2005 at 07:34:11PM +0000, Szabolcs Illes wrote:
> Hi All,
> 
> I have been using reiser4fs for 4 months without any problem since 
> today. After tryinig to open a movie with mplayer a have this in my log:

how large was the movie file?  We have another similar bug report related to
writing/reading of a large (20GB) tar file, so file size may be important.

> Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: 
> write_sd_by_inode_common (fs/reiser4/plugin/object.c:480)[nikita-2221]:
> Feb 27 14:00:22 sunset kernel: WARNING: Failed to save sd for 1599330: -5
> Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: create_child_common 
> (fs/reiser4/plugin/dir/dir.c:501)[nikita-2219]:
> Feb 27 14:00:22 sunset kernel: WARNING: Failed to create sd for 1599330
> Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
> (fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
> Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
> Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
> (fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
> Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
> Feb 27 14:00:24 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
> (fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
> Feb 27 14:00:24 sunset kernel: WARNING: Wrong level found in node: 1 != 95
 
Thanks,
-- 
Alex.
