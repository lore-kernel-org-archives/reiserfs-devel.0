From: Szabolcs Illes <illes@cpc.wmin.ac.uk>
Subject: Re: reiser4 bug
Date: Fri, 04 Mar 2005 14:38:32 +0000
Message-ID: <422872E8.4020301@cpc.wmin.ac.uk>
References: <422220B3.8000800@cpc.wmin.ac.uk> <20050304134843.GK6393@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050304134843.GK6393@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Alex Zarochentsev wrote:

>Hello,
>
>On Sun, Feb 27, 2005 at 07:34:11PM +0000, Szabolcs Illes wrote:
>  
>
>>Hi All,
>>
>>I have been using reiser4fs for 4 months without any problem since 
>>today. After tryinig to open a movie with mplayer a have this in my log:
>>    
>>
>
>how large was the movie file?
>
It was about 300MB. But previously I have copied a lot of relative big 
movies (600-700 MB).

>  We have another similar bug report related to
>writing/reading of a large (20GB) tar file, so file size may be important.
>  
>
I think the larges file I have ever stored using reiser4 was about 3 or 
4 GB. ( for example: vmware disk images, dvd isos ...)

>  
>
>>Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: 
>>write_sd_by_inode_common (fs/reiser4/plugin/object.c:480)[nikita-2221]:
>>Feb 27 14:00:22 sunset kernel: WARNING: Failed to save sd for 1599330: -5
>>Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: create_child_common 
>>(fs/reiser4/plugin/dir/dir.c:501)[nikita-2219]:
>>Feb 27 14:00:22 sunset kernel: WARNING: Failed to create sd for 1599330
>>Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
>>(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
>>Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
>>Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
>>(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
>>Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
>>Feb 27 14:00:24 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
>>(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
>>Feb 27 14:00:24 sunset kernel: WARNING: Wrong level found in node: 1 != 95
>>    
>>
> 
>Thanks,
>  
>

