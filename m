From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 10:46:21 -0700
Message-ID: <411909ED.5050201@namesys.com>
References: <20040810175005.A085915E31@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810175005.A085915E31@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'Alex Zarochentsev' <zam@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>

David Dabbs wrote:

>
>  
>
>>Let me be more precise here.  Is the time spent mounting and umounting
>>included in the time for the phase?
>>    
>>
>
> [David Dabbs] 
>No. Each phase iteration is wrapped in a time call. The mounting and
>unmounting happen before and after this, so there's shouldn't be any timing
>impact. I'd need to double check the sources, but I'm pretty sure that's the
>case.
>
>David
>
>
>
>
>  
>
Oh, well, then my criticism is invalid.
