From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 13:36:28 -0500
Message-ID: <407C332C.9000500@mrs.umn.edu>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C1E1F.30708@mrs.umn.edu> <407C2CD6.2070002@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407C2CD6.2070002@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

John D. Heintz wrote:

> Hi Grant,
> 
> No, I'm not familiar with this. I was trying to frame my questions 
> strictly in terms of Reiser4 naming constructs (the '/' operator only).

I only bring it up because extended attributes seem to have dealt with 
your mentioned problem, potential name conflicts, without trouble.  They 
use a "." as name separator but it is immaterial.

> 
> Do the extended attributes show up as file system paths? Or is there a 
> separate API to access them? If they show up as paths then I think they 
> are very loosely like what I'm talking about: a shorthand syntax that by 
> convention disabiguates similiar names.

They are invisible through normal POSIX API.  They have new system 
calls: getxattr, setxattr, listxattr, and removexattr which get, set 
list, and remove extended attributes.

> 
> Thanks for the reference, I'll look into this when time permits.
> 
> John
> 
Thanks

