From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Plugins: Pseudo-fun.
Date: Thu, 10 Nov 2005 20:13:04 +0000
Message-ID: <200511102013.05169.Peter.Foldiak@st-andrews.ac.uk>
References: <200511090320.33063.pvh@uvic.ca> <200511101217.54513.Peter.Foldiak@st-andrews.ac.uk> <43738086.4060807@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43738086.4060807@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Peter van Hardenberg <pvh@uvic.ca>

On Thursday 10 November 2005 17:16, Hans Reiser wrote:
> >cat /home/peter/book
> >
> >instead of
> >
> >cat /home/peter/book/..../childcat
>
> yes, but the creator of book should define that book/default is linked
> to ..../childcat, and should be able to make it something else if he
> chooses.

Yes, it should be possible to make it something else. But perhaps if all you 
want is simple concatenation, that could be automatic (unless something else 
is specified).

(And should it be book/..../default, after all, isn't this typical metadata?)

What is the best way to specify such an object "constructor"?
(Should it be just a script? But that wouldn't work in the kernel, right?)
 PF
