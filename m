From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 09:10:12 -0700
Message-ID: <200510260910.12136.pvh@uvic.ca>
References: <200510251558.13860.pvh@uvic.ca>
 <87k6g1yp5a.fsf@evinrude.uhoreg.ca> <435F7A2A.5020506@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <435F7A2A.5020506@st-andrews.ac.uk>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On October 26, 2005 05:44 am, you wrote:
> Also take a look at the part of a (record-breakingly long?) thread "file
> as a directory" on this list (also copied to lkml) near and after:
>
> http://www.ussg.iu.edu/hypermail/linux/kernel/0411.3/0044.html
>
> There, I suggested that file selection should be unified with
> part-of-file selection using XPath-like syntax.
>
> To do what you are suggesting efficiently would be really nice. To do it
> inefficiently (with a shell script) may still be interesting, possibly
> even useful. But as XPath was originally inteded for selection inside
> XML files, it would also be nice if (at least for your XML files) you
> could select inside your files using a unified syntax!
>  Peter

The objections raised about this on the LKML are quite valid. I could see 
there being value in this kind of access, and an "XML" plugin or a 
"dictionary file" plugin could be useful, given sufficient time to mature and 
address issues of stability and security. 

Personally, I LIKE the bytestream. I think it is a sensible enough 
building-block for abstraction. I imagine the filesystem as a tree with named 
branches that has streams hanging off it like Christmas ornaments.

Ontologically, this is a nice simplification. Every node has the potential to 
be a file, no node has the requirement of being a file. The names are managed 
independently from the streams. Further, keeping the contents of streams 
opaque in the general case makes sense to me. Streams are already both simple 
and flexible, and a mechanism already exists for putting assigning a unique 
namespace to data.

In fact, instead of creating XML files with a plugin, I would personally try 
splitting them into many small files and write a userspace DOM-library that 
maps calls like "node.getChildren" to calls like "readdir(NODE)". So: instead 
of XMLfile/entry/@attribute parsing an XML file, there would actually be 
files in there.

Although I freely acknowledge my inexperience, I believe the real problems are 
related to graph traversal algorithms. Linus has commented on the obvious 
hardlink issues. I imagine there are more gremlins lurking in the shadows on 
this one. Garbage collectors have largely given up on reference counting, a 
luxury afforded by blazingly fast access to small amounts of storage. I am 
not particularly up on the research though.

Also: I still have not been able to USE files as directories. Yes, I can reach 
file/..../, but that is only one special case. I can crash things like it was 
going out of style by playing with these file-directories. Does nobody have 
any experience with this? What kind of work is it going to take me to get 
this going?

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
