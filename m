From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 11:34:27 -0700
Message-ID: <413DFF33.9090607@namesys.com>
References: <200409070206.i8726vrG006493@localhost.localdomain>	<413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3d60yjnt7.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christer Weinigel <christer@weinigel.se>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Christer Weinigel wrote:

>David Masover <ninja@slaphack.com> writes:
>
>  
>
>>|>Second, there are quite a few things which I might want to do, which can
>>|>be done with this interface and without patching programs,
>>| Such as?
>>They've been mentioned.
>>    
>>
>
>  
>
>>| Haven't seen any that made sense to me, sorry.
>>Sorry if they don't make sense to you, but I don't feel like discussing
>>them now.  Either you get it or you don't, either you agree or you
>>don't.  Read the archives.
>>    
>>
>
>Great argument.  Not.  There has been so much shit thrown around here
>so that it's impossible to keep track of all examples.
>
>Could you please try summarize a few of the arguments that you find
>especially compelling?  This thread has gotten very confused since
>there are a bunch of different subjects all being intermixed here.
>
>What are we discussing?
>
>1. Do we want support for named streams?
>
>   I belive the answer is yes, since both NTFS and HFS (that's the
>   MacOS filesystem, isn't it?) supports streams we want Linux to
>   support this if possible.
>
>   Anyone disagreeing?
>  
>
No, we want files and directories that can do what streams can do.  This 
means files that are also directories, plugins that aggregate the 
contents of a directory, files that inherit stat data, maybe I forget 
something ---- it is on my website.

Streams themselves are a bad idea because they are a filesystem inside 
of a file which is double the overhead, and they fragment the namespace.

>4. What belongs in the generic VFS, what belongs in Reiser4?
>
>   Some things reiser4 do, such as files-as-directories need changes
>   to the VFS because it breaks assumptions that the VFS makes
>   (i.e. a deadlock or an oops when doing a hard link out of one).
>
>   Some other things reiser4 can do would be better if they were in
>   the VFS since other filesystems might want to support the same
>   functionality. 
>  
>
It is always better to lead by example.  These ideas are too new for the 
other fs developers, they need 5 years to get used to them.  Reiser4 
should create something that works, and let others follow when they will.

>   Or Linux may not support some of the things reiserfs at all.
>
>5. What belongs in the kernel, what belongs in userspace?
>  
>
This is the wrong question.  The right question is, what belongs in a 
unified namespace?  Then having answered that, the extent to which it is 
easier to have all aspects of name resolution together in one body of 
code is an implementation detail that can change and evolve with time.  
A rapidly evolving namespace is easier to modify if it is all one body 
of code.  Furthermore, the people doing the work should really be left 
to decide such implementation details themselves because they are more 
expert on their code than anyone else. 

Hans

