From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 10:14:37 -0800
Message-ID: <200601121014.37940.pvh@uvic.ca>
References: <200601111759.14638.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <200601111759.14638.fred@lab.matcom.uh.cu>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>

Hi Yoanis, good to see you're still pursuing this.

On January 11, 2006 02:59 pm, Yoanis Gil Delgado wrote:
> This are the intentions:
> To write a versioning plugin that will allows the file system user to
> easily revert the files under versioning to a some previous state.  The
> plugin will allow to revert the file state, based on revisions number and
> date modifications(and not sure about this one). There will be a special
> pseudo file named "previous" that will return the previous version of the
> file. The final result should allow to the the following actions:
>
> $ echo 1 > myfile.txt  (let's say we make this command at Wed Jan 11
> 16:53:55) $ echo 2 > myfile.txt  (let's say we make this command at Wed Jan
> 11 16:54:57) $ echo 3 >> myfile.txt (let's say we make this command at Wed
> Jan 11 16:55:59)
>
> Suppose you want the latest version, then you type:
> $ cat myfile/.../previous
>  Some other content
> Or you want the n-th version, then you type:
> $ cat myfile/.../1
>  Some content
> $ cat myfile/.../2
>  Some other content
> $ cat myfile/.../3

This is going to clutter the ... directory rather a lot. Instead of adding 
more files into "...." (which, by the way, is completely obscure) I would 
suggest you create a new pseudo directory.

Perhaps:
$ cat myfile/.^4/history/previous
$ cat myfile/.^4/history/version/1
still not quite right, but at least it contains a bit more information about 
what the "1" refers to.

>  Some other content
>  Some more content
> $
> Or the version nearest to some date, then you type:
> $ cat myfile.txt/.../Wed\ Jan\ 11\ 16:50
>  Some other content

There are already userspace tools which can determine the file creation date. 
Just use those, instead of dealing with date parsing in kernel-space. Date 
parsing is a way, WAY more subtle problem than you want to deal with. To see 
a group that has spent some time on it, check out the Date::Parser for Perl.

Using "grep" or "find", or "ls" or whatever other tool will accomplish this in 
a much more thorough and Unix-consistent way and also save you a pile of 
coding time. Believe me, you're going to need it.

>
> Also , there will be an special attribute named under_versioning(or
> something like that), that will tell if the file is under versioning. This
> plugin will not track directories version, although it's a future plan(I
> think this should be mixed with some undelete plugin).
>

I imagine that attribute should be
$ echo "1" > myfile.txt/..../plugins/versioning
or
$ echo "everywrite" > myfile.txt/..../plugins/versioning

Unfortunately, my experience is that you cannot use "echo" to change the data 
in the plugins/* pseudoplugins, even when it should be legal to do so. I just 
had a little ruby script that looked roughly like this:

f = open pseudofile;
f.write('newplugin');
f.close;

Never had the time to figure out why that was necessary, but there it is. 
(There is a comment on the plugin-wiki gotchas section.)

> I'm planning to use a delta techniques for versioning storage (delta
> compression). The versioning will be at the write level. The versions will
> be saved in a special directory under the filesystem. I think the hard part
> is the one related to detecting the changes (a COW it's a possible
> solution, but i think it's to expensive). I'm thinking a possible solution
> will be detecting the bytes changing in each write and archiving then as
> the difference.  This introduce some problems like :
> 1-) What happens if the file shrinks?
> 2-) What happens if the file grows ?
>
> I will send another email with a solution to this problems.

This will not be easy, I look forward to seeing your solution.

>
> I've also plans to extent the documentantion of plugins creation in reiser4
> with the experiences of this project. I'll be working in this plugin for
> more than 4 months. If you're interested you're welcome to the the
> team(just me right now :D )

Well, I have my own fish to fry, but I hope you will document your experiences 
on the Reiser4 programmer's wiki, currently housed at:
http://pvh.ca/trac/wiki/reiser4

There is lots of important information there for new Reiser4 plugin 
developers, and it will continue to grow as time goes by.

> Well....... I think this is all (for now  :D ). Please let me know what you
> think.

I would second Hans' suggestion about a "..../version/snapshot" file which 
would essentially act like a "cvs commit" on that file. I'd suggest that 
there be two similar versioning plugins, one which automatically versions 
after each write, and one which only does it when explicitly asked to. See 
the fibration plugin type for an example of this.

-p

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
