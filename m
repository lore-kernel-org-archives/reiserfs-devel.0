From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 15:47:37 -0500
Message-ID: <42CC4369.3070005@slaphack.com>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a> <87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com> <42CBD7F6.2050203@slaphack.com> <42CC1DEE.7030502@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CC1DEE.7030502@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, vitaly@thebsh.namesys.com

Hans Reiser wrote:
> David Masover wrote:
> 
> 
>>And, once we start talking about applications, /meta will be more
>>readily supported (as in, some apps will go through a pathname and
>>stop when they get to a file, and then there's tar).  On apps which
>>don't have direct support for /meta, you'd be navigating to the file
>>in question and then manually typing '...' into the dialog, so I don't
>>see why typing '...' at the end is better than typing '/meta' or
>>'/meta/vfs' at the beginning.
> 
> 
> Performance.  If you type it at the end, and you already have done the
> lookup of the filename, then you can go from the file to one of its
> methods, instead of a complete new traversal of another tree under /meta

Only, it's a different view of the same tree.  That may not matter 
performance-wise, though.

Also, for performance-critical applications, the /meta tree is pretty 
easy -- it becomes more like /meta/inode/some_inode_number/.

There's also the chroot issue, though.

>>That said, I'm still not entirely sure how we get /meta/vfs to work
>>other than adding a '...' sort of delimiter anyway.
>>
>>
>>>>And a question: is it feasible to store, for each inode, its parent(s),
>>>>instead of just the hard link count?
>>>>
>>>>
>>>
>>>Ooh, now that is an interesting old idea I haven't considered in 20
>>>years.... makes fsck more robust too....
>>
>>
>>Doesn't it make directory operations slower, too?
> 
> 
> Not sure.  It consumes space though.
> 
> 
>>And, will it require a format change?
>>
> 
> Yes, but we have plugins now, so.....

So, will the format change happen at mount time?  Will it need a special 
mount flag?  Will I need to use debugfs or some other offline tool?


