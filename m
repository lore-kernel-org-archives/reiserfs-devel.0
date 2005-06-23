From: Hans Reiser <reiser@namesys.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 12:24:28 -0700
Message-ID: <42BB0C6C.8070308@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>	 <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>	 <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB0151.3030904@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.de>
Cc: Pekka Enberg <penberg@gmail.com>, Andi Kleen <ak@suse.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Jeff Mahoney wrote:

>Pekka Enberg wrote:
>  
>
>>>--- /dev/null	2003-09-23 21:59:22.000000000 +0400
>>>+++ linux-2.6.11-vs/fs/reiser4/pool.c	2005-06-03 17:49:38.668204642 +0400
>>>+/* initialise new pool */
>>>+reiser4_internal void
>>>+reiser4_init_pool(reiser4_pool * pool /* pool to initialise */ ,
>>>+		  size_t obj_size /* size of objects in @pool */ ,
>>>+		  int num_of_objs /* number of preallocated objects */ ,
>>>+		  char *data /* area for preallocated objects */ )
>>>+{
>>>+	reiser4_pool_header *h;
>>>+	int i;
>>>+
>>>+	assert("nikita-955", pool != NULL);
>>>      
>>>
>>These assertion codes are meaningless to the rest of us so please drop
>>them.
>>    
>>
>
>As someone who spends time debugging reiser3 issues, I've grown
>accustomed to the named assertions. They make discussing a particular
>assertion much more natural in conversation than file:line. It also
>makes difficult to reproduce assertions more trackable over time. The
>assertion number never changes, but the line number can with even the
>most trivial of patches.
>
>That said, one of my gripes with the named assertions in reiser3 (and
>reiser4 now) is that the development staff changes over time. There are
>many named assertions in reiser3 that refer to developers no longer
>employed by Hans. The quoted one is a perfect example.
>  
>
Yes, but when I get stuck I still send him an email and he still sends
me an answer.  He is a nice guy even if he can't stand working for me....

>Hans, would it be acceptable to you to keep only numbered assertions and
> keep a code responsbility list internal to namesys?
>
No effort to document who is the current maintainer of a section of our
code (and thus presumed to be able to figure something nonobvious about
it out) has ever worked as well as these named assertions. 

Efforts to put at the top of files who worked on what part of it always
get miserably out of date, and people are always too shy to update them
for valid social reasons.

Internal lists are not the open source way.

The reason some developers hate these named assertions is because they
are afraid that it makes them famous for their bugs, when actually it
does not.  Assertions hit are not equal to bugs authored, and users
understand that better than those developers think.  Writing an
assertion means you can understand a bug, not that you created it.  The
real effect of your name being on many assertions is that people know
you contributed a lot.

It is not necessary for Namesys to be an opaque corporation with no
faces on its surface.  My name is on the filesystem, every bit of credit
I can give to the others I owe them many times over. 

