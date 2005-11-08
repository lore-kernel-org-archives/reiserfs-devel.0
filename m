From: Hans Reiser <reiser@namesys.com>
Subject: Re: Plugin authoring.
Date: Tue, 08 Nov 2005 09:42:36 -0800
Message-ID: <4370E38C.9090605@namesys.com>
References: <200511050017.20410.pvh@uvic.ca> <436EFABA.6070408@namesys.com> <200511080300.24424.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511080300.24424.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

Peter van Hardenberg wrote:

>I'm keeping this on-list in the hope that a record of it may be of value to 
>other future "weekend-warriors" on how we approached this problem.
>
>On November 6, 2005 10:56 pm, Hans Reiser wrote:
>  
>
>>Peter van Hardenberg wrote:
>>Just start reading the regular unix file and directory plugins, and
>>compose a long email with questions about how they work.
>>
>>    
>>
>
>Well, here we go!
>
>Today we spent a few hours poring over dir.c and file.c as Hans recommended 
>and branched out as we went. 
>
>Some things were unexpected, header files contained some complete inlined 
>methods, and the almost no documentation (it is all in the .c files.)
>
>Lots and lots of layers of indirection taking place. The dir.c and file.c are 
>almost all irrelevant to our current pursuit which is understanding how to 
>actually write a plugin, and therefore how the plugins system actually works. 
>Eventually Nathan found the clues that led us to success in file_ops.c -- 
>there actual VFS calls get converted to reiser calls!
>
From there, we tracked down the reiser4_inode extensions and the clever use of 
>reiser4_inode_data() to essentially cast back and forth between the structs.
>
>Of course, inode.h was similarly enlightening, but worrying to me is the fact 
>that plugins like crypt and pseudo contain fields in all reiser4_inodes. This 
>means that a plugin's code is not encapsulated strictly within the plugin 
>itself.
>
An interesting point.  Edward, please comment.

> I will probably do some grepping hunts tomorrow to see how many files 
>a plugin like pseudo actually has to worm its way into.
>
>None of us are experienced with plain old VFS (except our supervisor, Yvonne, 
>who has kept us on course so far). It was our hope that we needn't learn VFS 
>in complete detail, but it seems now that before we can really understand the 
>Reiser code well enough to write plugins we will need to read some less 
>complex examples of Linux filesystems. "du -sh fs/*" suggests that BFS and 
>Coda should be simple enough to absorb the principles of in a single sitting.
>
>It would help if within Reiser4 code more roadmaps were given -- we found a 
>backtrace in a comment somewhere which was most illuminating. Personally, I 
>was rather puzzled within file.c about what tails, hints and extents are. I 
>  
>
tails and extents are on the website.  do hints need a comment in the .h
?....

>was working from paper printouts without Google handy but certain knowledge 
>definitely seems expected, and I have not found a reliable method for 
>differentiating Reiser-specific terminology from the more generic.
>
From a legibility point of view it would be nice if all the method signatures 
>were found in headers instead of only public methods in file.h and private 
>ones throughout the file itself. To preserve the "public" "private" 
>distinction, perhaps a second header file would be appropriate? I am only 
>thinking out loud here. 
>
>All in all, project progress is good. We have figured out (roughly) how calls 
>from VFS are translated into Reiser4 calls and then into plugin calls via a 
>lookup on the pluginid in the inode. I am still looking for some kind of 
>structure in the plugin.c code itself which mediates the translation from a 
>pluginid to an actual table of methods, and how the plugin itself announces 
>those associations.
>
vs, please comment

> Is there a table? A naming convention? Something 
>promising was in there, but it is now three in the morning and my memory is 
>fading slightly.
>
>More tomorrow (today in most time zones),
>-pvh
>
>  
>

