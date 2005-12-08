From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Two usage examples for attribute directories.
Date: Thu, 08 Dec 2005 14:12:46 +0000
Message-ID: <43983F5E.3080704@st-andrews.ac.uk>
References: <200511201317.12598.pvh@uvic.ca> <200512021649.54939.pvh@uvic.ca> <43917967.4080008@st-andrews.ac.uk> <200512042027.16525.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200512042027.16525.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

Peter van Hardenberg wrote:
> Still, say we'd like to be able to also specify some attributes for app, let's 
> say "author", "version", "name", "description", "contact", "category" -- 
> things that would be useful for creating a menu entry.
>
> Now the directory begins to get ugly...
>
> $ ls app/
> author
> bin
> category
> contact
> description
> lib
> name
> src
> var
> version
> Makefile
> icon.png
> install.sh
>
> But which are attributes? If only our namespace provided us a way to seperate 
> one group of files from another... Aha! Why not a directory?
>   

You say "author" should be an attribute but "icon.png" is not an 
attribute. I am not convinced they should be treated differently.
The listing doesn't look ugly to me at all (just because it is long).

> Ahh, much better. It also ensures we can preserve Hans' goal of not enforcing 
> unnatural structure.  What if I want to find all the files Hans is in any way 
> associated with, whether it is as "author", "contact", "inspiration", 
> whatever.
>
> I don't want to look into EVERY file on the disk if I don't have to. Instead, 
> I can just 
>
> $ grep "Hans Reiser" */@/* 
>   

I don't think this is a nice solution.
The nice solution is what is suggested in Hans' whitepaper:

[HansReiser]

which would give you all objects associated with Hans, and this would be 
efficient (unlike */@/*).
(Read
http://www.namesys.com/whitepaper.html
again.)

> without having to grep through gig upon gig of other data. Of course, if 
> that's what I want to do, the option is still there...
>
> SO! Why privilege the @ directory with its own plugin?

Quite. You shouldn't.

> Why not just use it as 
> a convention?
>
> Efficiency. Files governed by the @ plug-in could have size restrictions,

Arbitrary limits are disliked in Linux, with good reason.

> should be packed tightly with their parents. They might have special format 
> to fit more into a single disk read. They could be indexed by the operating 
> system to make searching for particular values fast.
>   
An efficient implementation of "[ ]" would do the indexing, or would 
have the same effect.

> Thus, I conclude that while file-directories are valuable and closely related 
> to attribute directories, but the two serve different roles and have 
> different design goals, so should be served by different plugins.
>   

Where does the term "attribute directory" come from? Did you invent it?
Are they your "@" directories, or is that referring to something more?

Thanks, Peter

