From: Hans Reiser <reiser@namesys.com>
Subject: Re: Resier Fragmentation Effects (was compression vs performance)
Date: Thu, 08 Apr 2004 22:53:08 -0700
Message-ID: <40763A44.4040107@namesys.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469DBF@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469DBF@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: Stewart Smith <stewart@flamingspork.com>, Tom Vier <tmv@comcast.net>, Scott Young <youngs1@sunyit.edu>, reiserfs-list@namesys.com

Burnes, James wrote:

>I thought nearly all filesystems designed since Berkeley FFS were nearly
>immune to fragmentation problems.
>
>After reading the following analysis at Harvard, it seems that
>fragmentation is still a problem.
>
>http://www.eecs.harvard.edu/~keith/research/tr94.html
>
>  
>
Yeah, I wish I had read this in 94.  V3 suffers from the same problems 
as FFS does as described in the abstract (all that I read, sorry about 
that, I really am a bit busy, so unless someone suggests I should read 
more.... ) .  V4 cures it though.

-- 
Hans

