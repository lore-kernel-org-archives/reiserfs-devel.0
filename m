From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 09:32:38 -0700
Message-ID: <4141D726.60801@namesys.com>
References: <88320341394-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <88320341394-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Thu, 09 Sep 2004 22:22:51 -0700:
>  
>
>>This was actually pretty decent as a design, but then a user on the 
>>mailing list suggested replacing the '..' prefix with a subdirectory 
>>prefix. I forget who suggested this and what the prefix was exactly. So 
>>we then created a '..metas' subdirectory, and this had the advantage 
>>that one could ls it to see all the builtins supported by a given 
>>plugin. This is not an important advantage, and I encourage others to 
>>critique it.
>>    
>>
>
>Like I said before, it breaks orthogonality by introducing a directory
>which isn't a file/directory like the others.  ..metas can't have
>attributes attached to it like other files can.
>
That does not have to be true.  Whether ..metas contains only builtins 
can be nothing more than a style convention, or it can be a plugin 
property for plugins that don't want other files to pretend to be their 
builtins.

>  In practical use,
>that makes it difficult to display in a GUI view, where you might want
>to attach attributes describing the ..metas directory window size and
>position.  The GUI code would have to special case it, for those times
>when you want to drill down and see what's attached to a file.
>
>On the other hand, it does satisfy the Human need to group things
>together neatly, like you said.  But then so does Tetris :-).
>
>- Alex
>
>
>  
>

