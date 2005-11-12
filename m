From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 09:06:54 -0500
Message-ID: <1131804415.8550.14.camel@localhost.localdomain>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511111656.04891.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

On Fri, 2005-11-11 at 16:56 -0800, Peter van Hardenberg wrote:
> On November 11, 2005 05:59 am, John Gilmore wrote:
> > Does anybody remember GoBack? It was a versioning
> > system for windows 95/98 that was incredibly flexible and useful. Tracked
> > all changes to the whole disk. Old versions of a file? no problem. grab an
> > old version of a directory for referance temporarily? easy. Got a virus?
> > revert the whole HD, and then grab the newer copies of your documents and
> > saved games as needed.
> 
> My thoughts on this:
> 
> The versioning would be an audit plugin. When the file is modified, tag the 
> current version, copy it into a sub-directory (oh, I don't know, say 
> file/.revisions/<number/date>), and disable write access to it. You might not 
> even need extended filesystem attributes for this, but they would be handy 
> for tagging particular versions.

if a file is opened, modified 2 times, then closed. u will only generate
1 version right? so "When the file is modified" is inaccurate.

> 
> Copy-on-write would make this action extremely cheap, only adding a couple of 
> extra writes to make it work.

add 1 line at the beginning of a 100MB text file will make this uncheap.
all data are shifted.


> 
> Given working resource directories, COW, and the ability to set plugins, this 
> might be a relatively easy hack to implement. Given an efficient xpath shell, 
> you could even create a view of your drive on a particular day. 
> 
> If you had a file that was changing often, perhaps you could set an attribute 
> on that file which told it only to clone the file every once in a while. 
> 
> Come to think of it, a userspace daemon could run in the background and 
> replace the need for a plugin, which is probably the better solution. Then 
> you just need COW and files which can contain resources.
> 
> -pvh
> 

