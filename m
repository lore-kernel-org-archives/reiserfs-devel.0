From: Guido Schimmels <guido.schimmels@freenet.de>
Subject: Re: Will Reiser4 support a "hidden" attribute?
Date: Thu, 20 Nov 2003 20:45:55 +0100
Message-ID: <20031120194555.GA23113@Benine>
References: <20031120005844.GC8854@Benine> <1069305523.11497.37.camel@faith> <20031120142353.GA1253@Benine> <3FBC6050.3050600@namesys.com> <16317.3267.987713.833145@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16317.3267.987713.833145@laputa.namesys.com> (from Nikita@Namesys.COM on Don, Nov 20, 2003 at 19:49:39 +0100)
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: reiserfs-list@namesys.com

Am 20.11.2003 19:49:39 schrieb(en) Nikita Danilov:
> Hans Reiser writes:
>  > Nikita, please update us all on how far we have gotten in
> implementing this.
> 
> OK.
> 
> We currently don't have ability to hide particular file. That is,
> there
> is no way to somehow mark file hidden at the kernel level. If I am
> allowed to humbly voice my opinion, usages shown by participants of
> this
> thread (trimming down list of files visible in the GUI front-end)
> should
> be done at the user level. In UNIX ls(1) command hides dot files for
> ages.

I have outlined why this is not an option. Handling this above the  
kernel/libc level means maintaining dozens of patches to consistently  
hide files throughout the GUI. And for Acrobat Reader e.g. you  would  
still need LD_PRELOAD trickery which means you are again down at the  
libc level. Thinking of it, an even better example is Sun's Java,  
which, though the sources are available, I'm not allowed to hack on.
