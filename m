From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: File-level copy-on-write?
Date: Fri, 11 Feb 2005 14:42:58 +0300
Message-ID: <1108122178.3899.95.camel@tribesman.namesys.com>
References: <420C6A4F.2060905@rolandpj.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23381-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <420C6A4F.2060905@rolandpj.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roland Paterson-Jones <roland@rolandpj.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2005-02-11 at 11:18, Roland Paterson-Jones wrote:
> Hi
> 
> I have an application where I want to make relatively frequent copies of 
> a large file, and the copies will remain largely similar to the original.
> 
> It seems to me that a file-level copy-on-write would support this well.
> 
> So, does reiserfs support anything like this?
> 

No.

> If not, can I implement this easily (how easily ;) ) with a plugin.
> 
I guess you mean plugin for reiser4?
You probably can but I do not think that it would be easy.

> Any ideas and pointers greatfully received

I think it would be easier to modify the application.
You should probably start with detailed definition of your COW protocol.

> Thanks
> Roland
> 
> 

