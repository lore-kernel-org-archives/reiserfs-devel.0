From: Hans Reiser <reiser@namesys.com>
Subject: Re: Multiple data streams...
Date: Wed, 02 Apr 2003 20:53:06 +0400
Message-ID: <3E8B1572.1010001@namesys.com>
References: <6167696812.20030402112847@tnonline.net> <3E8B0BED.2070004@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E8B0BED.2070004@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Users should know that these will never be accepted into ReiserFS, and 
the reasons why are explained at www.namesys.com/v4/v4.html



Jeff Mahoney wrote:

> Anders Widman wrote:
>
>>    Is this supported, or will it be supported by ReiserFS?
>>    I  use  this  feature quite quite much.. Maybe this is something to
>>    add to ReiserFS?
>>
>>    There is very brief info at Microsoft's website:
>>
>>    
>> http://www.microsoft.com/windows2000/techinfo/reskit/en-us/core/fncc_fil_khzt.asp
>
>
>     I have an implementation of extended attributes that has been 
> included in the SuSE kernel for some time now. It's not at all 
> suitable for filestreams with a lot of data, as the Linux extended 
> attribute interface requires that the entire attribute be read and 
> written in one chunk. However, for small things, such as mime type, 
> email sender, and perhaps even small thumbprints, this wouldn't be a 
> problem. The sizes of xattrs in my implementation aren't limited in 
> size, as they are implemented as regular files in a hidden tree. [*]
>
>     The patches are against the SuSE kernel at the moment, but if 
> there's enough interest, I could split them out to depend on the 
> generic  ACL/EA patches from Andreas Gruenbacher and Chris Mason's 
> data logging and quota patches.
>
>     I suppose that since the xattr files are normal files, it would be 
> pretty easy to implement a "datastream" xattr that could be accessed 
> using normal tools. The semantics could be similar to the windows 
> implementation, e.g. /foo/bar/file:datastream1 (Lookup the file 
> verbatim first, then try datastreams) However, since most of the 
> userspace tools are unaware of xattrs, the same restrictions that 
> apply for any other xattr apply: they'll be lost if you copy/backup 
> with tools that don't know about them.
>
>     -Jeff
>
> [*] My design requirements included not forking the filesystem in an 
> incompatible manner, this was the best way I came up with. If a 
> filesystem with xattrs on it is mounted with them disabled or by a 
> kernel that doesn't support them, the xattrs appear in a tree owned by 
> root (mode 700), with all the files owned by the user owning the file 
> that the xattr is associated with.
>


-- 
Hans


