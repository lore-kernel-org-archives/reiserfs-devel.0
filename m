From: Hans Reiser <reiser@namesys.com>
Subject: Re: security issue with metas/readdir in reiser4
Date: Mon, 29 Mar 2004 08:13:49 -0800
Message-ID: <40684B3D.9040807@namesys.com>
References: <200403282143.14376.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403282143.14376.filipe@rnl.ist.utl.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Filipe Almeida <filipe@rnl.ist.utl.pt>
Cc: reiserfs-list@namesys.com, Nikita Danilov <god@namesys.com>

Filipe Almeida wrote:

>Hi,
>
>There is a security problem with the implementation of dir/metas/readdir.
>This file is readable even if the directory isn't readable by the current 
>user.
>
Well, this is silly and will be fixed.

> This is against traditional unix behavior and is a security issue in 
>many configurations (apache user dir setups, spool directories of some MTA's, 
>etc).
>
>There are other minor issues, like metas/* appearing owned by the current uid 
>and not the actual file owner, and not returning EACCES while changing rwx 
>when you don't have permissions. Just silently ignoring the action.
>  
>
thanks much, Nikita will fix these.

>Regards,
>Filipe Almeida
>
>--
>Filipe Almeida <filipe@rnl.ist.utl.pt>
>http://mega.ist.utl.pt/~filipe/
>
>
>
>  
>


-- 
Hans


