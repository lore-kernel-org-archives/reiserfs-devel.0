From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 23:59:53 -0700
Message-ID: <4125A169.5080404@namesys.com>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net> <4123CE91.4090007@namesys.com> <4123E3C9.90006@comcast.net> <4123F77C.6060703@namesys.com> <41240A04.7000502@comcast.net> <41243FA3.1010609@namesys.com> <4124A194.3030902@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4124A194.3030902@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

George Beshers wrote:

>
>     include ".|..|[ac-z][b-z][a-qs-z]|...+"
>
> A moments thought and you will see that both can be implemented with
> 5 state finite state autometa (adding a failure/success state as the 
> 5th state
> with entire alphabet transitioning to the 5th state).

Yes, but you can avoid the transformation and just have a mask that 
excludes what it lists.  You can have bounce off points instead of fall 
through points.

You can also have the exclude be a completely separate mask from the 
include mask.

It is an interesting question whether that is a good or a bad idea....  
it might be a good idea but less space efficient.

>
> I completely agree that the exclude clause is much cleaner syntactically
> and the specification compiler should handle them (requirement), but
> I don't think they are a consideration in terms of the "compiled" spec
> that must be evaluated in the kernel as the process is being run.
>
> *Getting Pragmatic
> *
> I have been assuming a model something like the following:
>
>  -  There is a *presentation mask* format (the mask source) that is
>      platform independent and probably human readable.

Nah, I no longer think so, I like

ls -R executable/metas/mask

as what the humans look at.

>
>  -  There is a *compiled mask* which is designed to optimize *mask
>      evaluation*, i.e., the chroot like semantics.
>
>  -  The mask evaluation is done by the *mask interpreter* which is
>     in the kernel (reiser4 area until we take over the world ;-) ).
>
>  -  That the format produced by tracing can be converted to a
>     presentation mask for user editing.

Just use the filesystem tree and create a few fall through and bounce 
off plugins.

>
> Proposed definition:
>
>     An extension to the presentation mask language is *syntactic sugar*
>     Iff it does not require increasing the complexity of the mask 
> interpreter.
>

