From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 13 Apr 2004 11:14:48 -0700
Message-ID: <407C2E18.5070009@namesys.com>
References: <20040413180732.7450.qmail@web25004.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040413180732.7450.qmail@web25004.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Cc: Beni Cherniavsky <cben@users.sf.net>, reiserfs-list@namesys.com

Narcoleptic Electron wrote:

>Beni Cherniavsky wrote: 
>
>  
>
>>Note that changing the magic name (dynamically or
>>even by recompiling) 
>>can create a confilict with an *exisiting* file on a
>>reiserfs4 partition 
>>(the file could have been created when another name
>>was magic).  The FS 
>>code should be ready to handle it, preferably giving
>>some escape route 
>>way to access the colliding file (e.g.
>>``foo/my_metas/escape`` could 
>>give access to the file known as ``foo/my_metas``
>>before you changed the 
>>magic name to ``my_metas``).
>>    
>>
>
>That is a very good point, and I think your solution
>is the right way to get around it.
>
>
>______________________________________________________________________ 
>Post your free ad now! http://personals.yahoo.ca
>
>
>  
>
I think we should have a /metasoff hidden directory that presents the 
filesystem tree but without the metas.

Of course, now that we have funding for views, when that is completed 
you will be able to specify a view that cannot access metas.

-- 
Hans

