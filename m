From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Mon, 30 Aug 2004 23:43:13 -0700
Message-ID: <41341E01.10007@namesys.com>
References: <87599921834-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87599921834-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Sun, 29 Aug 2004 13:21:44 -0700:
>  
>
>>The Idea [...] Conclusion
>>    
>>
>
>Good summary!
>
>  
>
>>The Idea 2: [...]
>>cat filename/pseudos/backup gives a set of commands that a backup
>>command can use to create the file "filename" [...]
>>    
>>
>
>Are you sneaking in file types there?  Just how does a file know which
>plugins it supports?
>
>- Alex
>
>
>  
>
we have plugins with pluginids, is that what you mean by file type? I 
think they are a bit different from file types.
