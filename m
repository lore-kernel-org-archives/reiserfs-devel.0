From: Hans Reiser <reiser@namesys.com>
Subject: Re: Plugins: Pseudo-fun.
Date: Thu, 10 Nov 2005 09:16:54 -0800
Message-ID: <43738086.4060807@namesys.com>
References: <200511090320.33063.pvh@uvic.ca> <200511091105.44523.pvh@uvic.ca> <43724EA7.9010006@namesys.com> <200511101217.54513.Peter.Foldiak@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511101217.54513.Peter.Foldiak@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

Peter Foldiak wrote:

>On Wednesday 09 November 2005 19:31, Hans Reiser wrote:
>  
>
>
>
>So on this list (in connection with part-whole hierarchies) I argued 
>previously that paragraph 2 of chapter 3 of a book should be named
>
>book/chapter[3]/paragraph[2]
>
>and not anything else. It should NOT matter whether the person who scanned the 
>book decided to put each chapter into a separate "file" (whatever that 
>concept will become) or into one big "file" with some way (e.g. markup, e.g. 
>XML) to indicate the structure within that "file".
>You can read this as "paragraph 2 OF chapter 3 OF the book".
>I think I managed to convince Hans that on the long run, it would be much 
>better to be able to
>
>cat /home/peter/book
>
>instead of
>
>cat /home/peter/book/..../childcat
>  
>
yes, but the creator of book should define that book/default is linked
to ..../childcat, and should be able to make it something else if he
chooses.

