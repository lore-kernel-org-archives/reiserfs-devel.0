From: Chris Dawes <cmsd2@octomonkey.org.uk>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
	the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 20:49:28 +0100
Message-ID: <1093981768.18249.4.camel@dobbin.local.net>
References: <41323AD8.7040103@namesys.com>
	 <200408312055.56335.v13@priest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408312055.56335.v13@priest.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: V13 <v13@priest.com>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, reiserfs-list@namesys.com

On Tue, 2004-08-31 at 18:55, V13 wrote:
...
>   AFAIK and AFAICS the metadata are not files or directories. You can look at 
> them as files/dirs but they are not, just like a tar is not a directory. I 
> believe that the correct thing to do (tm) is to add a new 'concept' named 
> 'metadata' (which already exists). This way you'll have files, directories 
> and metadata (or whatever you call them). So, each directory can have 
> metadatas and files and each file can have metadatas. Then you have to 
> provide some new methods of accessing them and not to use chdir() etc. (lets 
> say chdir_meta() to enter the meta dir which will work for files too). After 
> entering the 'metadir' you'll be able to use existing methods etc to access 
> its 'files'.

I think this is what Hans is trying to avoid -- it results in creating a
separate namespace for the metadata.

I would agree with the notion that metadata nodes are light-weight files
in that they themselves have no metadata associated with them, but I
don't see why they need separate system-calls (if we can help it).

Chris Dawes.


> 
>   This approach doesn't mess with existing things and can be extended for 
> other filesystems too.
> 
> (Just a thought)
> 
> <<V13>>

