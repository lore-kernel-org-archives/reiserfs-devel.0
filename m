From: Hans Reiser <reiser@namesys.com>
Subject: Re: Participation in developement of Reiser4
Date: Wed, 03 Nov 2004 09:19:56 -0800
Message-ID: <4189133C.9050203@namesys.com>
References: <200411022342.02126.sikkh@wp.pl> <41891106.3000600@novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41891106.3000600@novell.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@novell.com>
Cc: Piotr Neuman <sikkh@wp.pl>, reiserfs-list@namesys.com

Jeff Mahoney wrote:


>
> All I can really give you as far as more specific advice is things I'd
> like to see done with reiser4. The most obvious one, and one that should
> be a fairly easy place to start, is to add support for the existing
> xattr API to manipulate attributes that reiser4 currently provides under
> the ..metas "meta-directory." The ..metas directory is quite
> contraversial, and I'd hate to see reiser4 fall by the wayside because
> it doesn't support a standard API.

No, please, don't work on this.

Work on copy on write links, and implement them as a plugin.  Sorry for 
my not responding earlier, I was somehow blanking on needed features 
even though we have a ton of them.

Copy on write links are probably feasible for a beginner.

Alternatively, look for fixmes scattered throughout the code, and fix 
one of them.

Or, find code that needs better commenting and comment it.

>
> If this feature is already implemented, I apologize, I haven't been
> following reiser4 development too closely.
>
> As a note to Hans, who I expect will object strenuously to this email,
> the issue of the elegance of the files-as-directories approach that
> reiser4 users is a debate that will not likely be concluded any time
> soon. I think the best thing for reiser4 to do is to cater to its users.

If I don't add elegance, why bother to write ReiserFS?  There are better 
ways to make money.

> Many users will disable the files-as-directories support because it does
> cause conflicts with existing apps. Whether that makes those apps
> "buggy" or not is irrelevant: Users will just use another filesystem
> rather than bug their favorite software author to adjust to a situation
> that no other filesystem presents. Users that want to use the ..metas
> approach are free to do so. To quote something that borders on trite
> these days, "Since when does Linux eliminate choice?"
>
> -Jeff
>
>
> --
> Jeff Mahoney
> SuSE Labs

