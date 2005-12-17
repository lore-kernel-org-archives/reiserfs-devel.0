From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: reiser4: writing plugins
Date: Sat, 17 Dec 2005 10:32:34 -0800
Message-ID: <200512171032.34752.pvh@uvic.ca>
References: <1134763128.18089.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1134763128.18089.10.camel@localhost.localdomain>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Danny,

It's good to hear from you. The Reiser4 plugin system is somewhat subtle. Over 
the past four months our group has attempted to become the first group 
outside Namesys to create a Reiser4 plugin. We have had some various 
successes and failures and are hoping to document much of the experience for 
general consumption.

-pvh

On December 16, 2005 11:58 am, dannym wrote:
> Hi,
>
> So I want to start writing a small plugin to get a feel for the
> architecture...
>
> I wonder how to do that?
>
> I read that in order to write plugins, one has to recompile the
> kernel... which is ok, but that also means that it will affect
> everything and when I make a mistake, everything goes bad :)
>
> So I wondered if all you reiser4 developers have some kind of sandbox
> thing that just does the same with a library (without the kernel) and on
> an image file?
>
> Or do you use a virtual machine for that kind of stuff?
>
> As for what I thought would be a nice intro thing for me to write is:
>
> Adds a pseudo file "tree-contents-size" for directories.
> Pseudo file contains the "du" starting from this directory.
>
> What it should do is cache some kind of "du"-like value per directory.
> When you change a file size (or delete a file, add a file, ...) in the
> dir or one of it's subdirs, it shall set a dirty flag on the value.
> When the pseudo file is accessed, it shall calculate it anew, also
> updating the subdirs' pseudo files if so needed, and store it actually
> on disk...
> (could also be updated periodically without anyone requesting it, but
> that's just a detail)
>
> What do you think? Useful? Bad Thing? Already done? Too hard for a first
> try?
>
> cheers,
>   Danny

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
