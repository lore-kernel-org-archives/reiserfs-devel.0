From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: file as a directory
Date: 30 Nov 2004 17:03:14 +0000
Message-ID: <1101834194.17826.194.camel@pear.st-and.ac.uk>
References: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>
Content-Transfer-Encoding: 7bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

On Tue, 2004-11-30 at 16:31, Horst von Brand wrote:
> > But namespace unification is important,
> 
> Why? Directories are directories, files are files, file contents is file
> contents. Mixing them up is a bad idea.

I disagree, I think it is a good idea.
Why is namespace unification important? Because you can use the same
tools on everything. Previously, each tool could handle one namespace.

A very simple example would be:
I want to count the words in the Appendix of my book.
If I can't select the appendix, my "wc" tool is useless (or very
difficult to use). On the other hand if I can say

wc ~/book/Appendix

it's fine. Hans Reiser would say that "namespaces are the roads and
waterways of the operating system" and "the value of an operating system
is proportional to the number of connections you can make". I think he
is right in that. And the authors of Unix knew it too, when they used
the same namespace for devices and files. They didn't say "files are
files and devices are devices". They said the difference should not
matter to the applications.
But there is still namespace fragmentation even in Unix, and this is
just one of them.

>  Sure, you could build a filesystem
> of sorts (perhaps more in the vein of persistent programming, or even data
> base systems) where there simply is no distinction (because there are no
> differences to show), but that is something different.
> 
> >                                         and to unify the namespace, you
> > have to use the same syntax. I guess you disagree with me on that. (If
> > not, how would you do it?)
> 
> I'd go one level up: Eliminate the distinctions that bother you, not try to
> patch over them.

But that is my point too. Peter

