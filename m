From: Hans Reiser <reiser@namesys.com>
Subject: Re: newbie dev requests
Date: Fri, 17 Oct 2003 13:12:15 +0400
Message-ID: <3F8FB26F.8010108@namesys.com>
References: <3F8ED394.9060708@burst.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F8ED394.9060708@burst.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Humphries <chris@burst.net>
Cc: reiserfs-list@namesys.com

Chris Humphries wrote:

> hello,
>
>     from reading the code.html page on the website,
>  is there any trivial bugs/features that anyone may
>  suggest that i can do?
>     i dont really know what i want to add, but i
>  want to help. i have a strong background in backend
>  programming, especially with databases. i hope this
>  may be of help. i know a good amount about good programming
>  and design, and just want to help.
>     so if you got little stuff that is available
>  let me know and i will start hacking away at it.
>     i am new to filesystems, yet understand the concepts
>  and theory i think, just not how it all works yet. so
>  baby steps are nice :)
>     anywho, hope to hear back with things i can do,
>  not matter how trivial.
>
> thanks,
> chris
>
>
>
I suggest you start by downloading the reiser4 code, reading it, and 
either inventing a new plugin or doing careful profiling of CPU usage 
during some benchmark of your choice.

-- 
Hans


