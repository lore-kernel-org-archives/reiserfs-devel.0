From: Hans Reiser <reiser@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Tue, 01 Apr 2003 20:21:40 +0400
Message-ID: <3E89BC94.5030308@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com> <200303301130.24136.phma@webjockey.net> <3E8824B4.55C63A55@namesys.com> <3E88300C.22B54FD7@namesys.com> <20030331133618.GO8452@hvs.envisage.co.za> <3E88496C.E83B780F@namesys.com> <20030331164502.GU8452@hvs.envisage.co.za> <3E8985D5.7CA598FF@namesys.com> <3E89B908.1070106@namesys.com> <76105761281.20030401181632@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <76105761281.20030401181632@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>>My policy is that user hassle should be minimal, and we should try to
>>select at least one default key management set of utilities to integrate
>>well with and test with.
>>    
>>
>
>  
>
>>Are you sure we should not get keys from the environment? Is there too
>>much performance cost?
>>    
>>
>
>  
>
>>It would be best if people could use applications that are unaware of
>>the crypto mechanism when accessing files.
>>    
>>
>
>I think this is very important. Making all software aware would be a
>much bigger task to accomplish?
>
>//Anders
>
>
>
>  
>
I think it is essential to the task that apps not be aware of keys.

-- 
Hans


