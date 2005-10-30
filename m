From: Hans Reiser <reiser@namesys.com>
Subject: Re: History plugin in ReiserFS?
Date: Sun, 30 Oct 2005 11:13:20 -0800
Message-ID: <43651B50.1080200@namesys.com>
References: <52152.80.235.110.72.1130698205.squirrel@mailhost.ut.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <52152.80.235.110.72.1130698205.squirrel@mailhost.ut.ee>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toomas Laasik <t008@ut.ee>
Cc: reiserfs-list@namesys.com

Toomas Laasik wrote:

>Hello,
>
>I was wondering if reiserfs has some sort of history plugin. I want a
>filesystem that manages files similar to CVS or SVN so that I can say for
>example that "I want asdasd.txt file exactly as it was on 15.10.2005
>14:20:05" and I can get it. Of cource keeping that kind of "changelog"
>takes much room on disk, but I assume one could set a percentage of disk
>space for history and/or max days to keep history from.
>  
>
Nothing yet exists, it should be done, and I encourage the doing of it.

>It is one of my university projects to make this kind of filesystem or
>modify some existing filesystem eg ReiserFS.
>  
>
Please send a design document.

>Any sugestions how to implement or where to start? Is something like that
>made already? Do you think that extending ReiserFS would be a good option?
>  
>
Yes.

>I searched Google trying to find some material about writing ReiserFS
>plugins, but found very little useful. 
>
The assumption made is that people who write plugins read the source
code.;-)   We get complaints from people about  our comments being too
long (oy veh), so.....

The other thing to do is to join our developers list, and ask lots of
questions.

>Maybe it's easier to start from
>scratch? The goal is not to make production safe filesystem, but just
>accomplish my task.
>
Why bother to write code if a few million aren't going to use it?  It is
always better to write less code and get it stable so it is widely
used......


> Of cource if it is possible I would like that what I
>do is useful not only to me but for others who might want something
>similar too.
>
>Thanks in advance,
>
>Toomas
>
>
>
>  
>
welcome to our community.

Hans
