From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Mon, 12 Apr 2004 14:21:56 -0500
Message-ID: <407AEC54.3060403@pobox.com>
References: <407AB9AE.3060801@pobox.com> <874qrpkwyi.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <874qrpkwyi.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

Hi Hubert,

Hubert,

I agree with you, but I don't think our suggestions are exclusive.

An "ls" can return the contents of the directory as you suggested and a 
"cat" could return tab and newline separated content. I'm using the 
ReiserFS /etc/passwd example as a template.

What you suggested would be a good first step, I was just trying to 
intuitively make my point.

Thanks,
John


Hubert Chan wrote:

>XML namespaces seems like overkill to me, but I'll let someone more
>qualified say something more intelligent.  I just have one other
>comment.
>
>  
>
>>>>>>"John" == John D Heintz <jheintz@pobox.com> writes:
>>>>>>            
>>>>>>
>
>[...]
>
>John> Other namespaces could be added to files/directories and I'd
>John> assume something like: `cat foo.txt/reiser4:namespaces` would list
>John> all the namespaces available for a particular file.  Something
>John> like:
>John> reiser4 http://www.namesys.com/v4
>John> streams http://www.evil-empire.com/streams
>John> snapcm http://www.snapcm.com/snapcm
>
>It's probably better to do:
>
># ls foo.txt/reiser4:namespaces
>reiser4
>streams
>snapcm
># cat foo.txt/reiser4:namespaces/reiser4
>http://www.namespaces.com/v4
>
>  
>

