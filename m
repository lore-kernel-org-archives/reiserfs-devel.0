From: Anders Widman <andewid@tnonline.net>
Subject: Re: Agressive selective pre-allocation
Date: Tue, 10 Dec 2002 18:17:35 +0100
Message-ID: <42270795265.20021210181735@tnonline.net>
References: <20021210074600.J26400@vestdata.no>
 <3DF61996.8050001@NightStorm.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF61996.8050001@NightStorm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> It seems to me that it would be better to have the file system keep 
> track of this itself.  If the following is known about each file:
>    original creation date
>    current file size
>    number of times extended
 
> then it might be possible to compute a growth policy.  For example when 
> extending a small file, just move and extend it.  As the file and 
> extention frequencies increase then create larger new extents.

> But the problem really is that apps don't actually "grow"these files but 
> instead rebuilds them.  Thus the file system sees a request to open a 
> new file and not to extend an existing one.  This would make tracking 
> the above parameters way beyond difficult.

Actually,  It is impossible to predict how an application will use the
filesystem.  The  very  best  and  easiest would be if the application
itself  allocated  enough  space  to  fit  the  entire file. Either by
telling  the  FS  that  the  final  size  of  the file, or by actually
creating a large empty file and internally keep a pointer where in the
it should write.

The  filesystem   writers   and  "followers"  could  try  to  persuade
application developers to do this. Maybe as Hans suggested, by using a 
plug-in system or something similar.

//Anders

