From: Hans Reiser <reiser@namesys.com>
Subject: Re: NFS issues
Date: Mon, 29 Mar 2004 07:53:13 -0800
Message-ID: <40684669.3080503@namesys.com>
References: <000201c41454$401eb860$50bc723e@ramy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000201c41454$401eb860$50bc723e@ramy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Ramy M. Hassan" <ramy@gawab.com>
Cc: reiserfs-list@namesys.com

Ramy M. Hassan wrote:

>I am currently using xfs on a very busy NFS server where stability, and
>performance are the main concerns. I started to benchmark reiser3 and
>found it outperforming xfs when I tune the file size to the average file
>size in my system ( my system deals with too many writes of relatively
>small files ). Apparently I will gain performance if I moved to reiser3,
>but I read on the web that there are data corruption problems when
>reiser is used with NFS, Is that fixed or not yet?
>
>Thanks in advance
>
>
>
>
>
>  
>
We believe all such issues were fixed long ago, I am guessing that such 
reports are likely to be write caching related.

-- 
Hans


