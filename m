From: Hans Reiser <reiser@namesys.com>
Subject: Re: Repacker and compression plugin
Date: Mon, 27 Mar 2006 23:25:47 -0800
Message-ID: <4428E4FB.6020201@namesys.com>
References: <BAY23-F11F5DCA23F3B7D6A5BD05F94DF0@phx.gbl>	 <194f62550603260931s21d2022fk@mail.gmail.com> <e50d039c0603261632m2021453bg33ba2e8fb98090d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e50d039c0603261632m2021453bg33ba2e8fb98090d6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Hulme <rob@robhulme.com>
Cc: reiserfs-list@namesys.com

> Are there any estimates of when the repacker and compression plugins
> will be available / stable?

This depends on how long we remain distracted by Hellwig and company more than by how long they take to complete.

As soon as we go into the kernel, zam and vs focus on the compression plugin stabilization followed by working on the repacker.  Neither of those tasks will take anywhere near as long as dealing with Hellwig's code changes  (none of which benefit reiser4 much).  Edward is working on the compression plugin, but it is a task that could much benefit from the senior guys helping him out with code audits and the like.

> Can anyone give me a feel for how reliable you consider the Reiser 4
> file system to be?

The users are more reliable sources than I am.  They have more computers running Reiser4 than I do.

It was stable, the VFS changes destabilized it, it is back to being stable again, the next release that I hope goes out this week will help that some more by a smidgen.

There is however one thing that could reduce stability in that patch, which is that we have changed the write code to greatly reduce CPU usage by not doing things 4k at a time.


Robert Hulme wrote:

>Any of the Reiser devs have an answer to my questions? :-)
>
>--
>  
>

