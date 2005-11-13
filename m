From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Technical plugin details
Date: Sat, 12 Nov 2005 18:34:24 -0800
Message-ID: <200511121834.24706.pvh@uvic.ca>
References: <200511111830.44199.pvh@uvic.ca> <4376517A.4040402@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <4376517A.4040402@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

On November 12, 2005 12:32 pm, you wrote:
> Peter van Hardenberg wrote:
> >Hans,
> >
> >I am having trouble modifying a file to use our new plugin. I've tried
> > writing various values into "foo/.^4/plugin/file" but it won't stick.
>
> This is a business of plugin->h.pops->change() method.
> And for regular file plugin this method (change_file) does nothing.
>

Thanks. That was exactly what we were trying to find. We did find it 
eventually, after experimenting with some other plugin types to determine 
what the problem was.

Of course, we are still trying to figure out how to actually create a file 
with a different file plugin. I guess I will have to read the reiser4("...") 
function as I can see no way to specify these things from a standard bash 
shell.

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
