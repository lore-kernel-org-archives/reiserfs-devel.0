From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 13:09:26 -0500
Message-ID: <407C2CD6.2070002@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C1E1F.30708@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407C1E1F.30708@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

Hi Grant,

No, I'm not familiar with this. I was trying to frame my questions 
strictly in terms of Reiser4 naming constructs (the '/' operator only).

Do the extended attributes show up as file system paths? Or is there a 
separate API to access them? If they show up as paths then I think they 
are very loosely like what I'm talking about: a shorthand syntax that by 
convention disabiguates similiar names.

Thanks for the reference, I'll look into this when time permits.

John

Grant Miner wrote:

>
> Are you familiar with the extended attribute name space?  An extended 
> attribute name has the form of namespace.attribute, eg. 
> user.mime-type, trusted.md5sum, or system.posix_acl_access. Currently 
> the user, trusted, and system extended attribute classes are defined; 
> more may be defined in the future.
>
> User  attributes  may  be  assigned to files and directories for 
> storing arbitrary  additional  information such  as  the  mime  type,  
> character set or encoding of a file. The  access  permissions  for 
> user attributes  are defined by the file permission bits.
>
> Trusted attributes  are  visible  and  accessible only  to  processes 
> that have the CAP_SYS_ADMIN capability (the super user usually has 
> this capability). Attributes in  this  class  are  used to implement 
> mechanisms in user space (i.e., outside the kernel) which keep 
> information in extended attributes to which ordinary processes should 
> not have access.
>
> System attributes are used by the kernel to store system  objects such 
> as Access Control Lists and Capabilities. Read and write access 
> permissions to system attributes depend on the policy implemented for 
> each system attribute implemented in the kernel.
>
>

