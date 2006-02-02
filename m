From: Hans Reiser <reiser@namesys.com>
Subject: Re: programming methodology terminology
Date: Wed, 01 Feb 2006 17:49:26 -0800
Message-ID: <43E16526.3040206@namesys.com>
References: <78426832169-BeMail@AlexDualP3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <78426832169-BeMail@AlexDualP3>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Sun, 29 Jan 2006 23:15:41 -0800:
>  
>
>>When you use a return value #define for two different meanings,
>>is there a name for that?  It is generally accepted to be bad
>>style, yes?
>>    
>>
>
>It might be called something overloading, perhaps Semantic Overloading?
>
>- Alex
>
>
>  
>
That sounds right.  At any rate, we should avoid doing it the way we do
with -E_REPEAT and its cousins..... ;-)
