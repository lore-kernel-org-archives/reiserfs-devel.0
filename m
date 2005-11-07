From: Hans Reiser <reiser@namesys.com>
Subject: Re: Plugin authoring.
Date: Sun, 06 Nov 2005 22:56:58 -0800
Message-ID: <436EFABA.6070408@namesys.com>
References: <200511050017.20410.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511050017.20410.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote:

>Hans,
>
>We would like to spend some time and arrange a plugin that would allow all 
>files to be usable as directories for arbitrary data.
>
>Our reading suggests that this could probably be done with an object plugin 
>that combines the functionality of Files and Directories. 
>
>As for the problem of hard links, we will simply disallow them.
>
Sounds ok to me.  Especially if implemented as a plugin so that people
who really need hard links can just not use that plugin.

At some later time, you/we can deal with the cycle detection problem and
consider turning them back on.

> Although they 
>have their uses, file-directories have their own interesting applications 
>which I believe deserve exploration regardless of the outstanding problem.
>
>Now that we have found our course, we would appreciate some advice on getting 
>started writing a plugin. I have read commentary that there is no "plugin 
>author's document" and that the source code will reveal all to those willing 
>to read it. Well, we are willing to read and hack, but need a few stars to 
>navigate by.
>  
>
Just start reading the regular unix file and directory plugins, and
compose a long email with questions about how they work.

>What code should we read in particular? Are there relatively simple examples 
>we may follow? Is there API documentation for the storage layer? If weekend 
>warriors are to be able to hack on Reiser, perhaps they can learn from our 
>experience. According to my limited research, there are no third-party 
>plugins yet that we can learn from.
>  
>
You are correct.   Edward Shishkin is as close as we get to a
third-party.;-)   (He is doing the compression plugin, and was not an
author of the regular plugins, but he works in the same office as the
guys who did.....)

>Peter
>
>  
>

