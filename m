From: Ric Wheeler <ric@emc.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 07:21:38 -0400
Message-ID: <43314242.1050802@emc.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl>	 <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz>	 <20050921000425.GF6179@thunk.org> <4330A8F2.7010903@emc.com>	 <4330ACE2.8000909@namesys.com> <4330B388.8010307@emc.com>	 <4330CDF1.4050902@namesys.com> <e692861c05092021552d39cecc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05092021552d39cecc@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gmaxwell@gmail.com
Cc: Hans Reiser <reiser@namesys.com>, vitaly@thebsh.namesys.com, Theodore Ts'o <tytso@mit.edu>, Pavel Machek <pavel@suse.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Gregory Maxwell wrote:

>On 9/20/05, Hans Reiser <reiser@namesys.com> wrote:
>  
>
>
>Another goal of the group should be to formulate a requested set of
>changes or extensions to the makers of drives and other storage
>systems.  For example, it might be advantageous to be able to disable
>bad block relocation and allow the filesystem to perform the action. 
>The reason for this is because relocates slaughter streaming read
>performance, but the filesystem could still contiguously allocate
>around them...
>
>  
>
I think that would be a bad idea - that is how drives used to work and 
it made the higher level file system code handle odd stuff.

In the field, what we tend to see is that drives that accumulate more 
than a very small percentage of bad blocks (say 100 out of many 
millions) tend to be on their way out and need replacing.

>Perhaps a more implementable alternative is just a method to find out
>which sectors have been relocated so the data can be moved off of them
>and they be avoided. (and potentially they be 'derelocated' to
>preserve the relocation space)
>  
>
I think that this kind of information is already at hand via smart, 
etc.  You could write an application to query this data base, but to do 
the reverse mapping from block number to file is not easy (i.e., you 
need to fibmap each file in the file system in order to construct the 
mapping).

>Ditto for other layers.. if a filesystem has some internal integrity
>function and a raid sweep has found that the parity doesn't agree, it
>would be nice if the FS could check all possible decodings and see if
>there is one that is more sane than all the others... This is even
>more useful when you have raid-6 and there is a lot more potential
>decoding.
>  
>
One thing we do on our boxes is to run a sweep program that does a 
"read-verify" command that allows us to flag bad sectors on the platter 
without transferring data, polluting caches, etc.  A second, repair 
phase goes in and pokes at the suspect sectors trying to force a remap.  
If you have the original data (as in the raid case), you can rewrite the 
sector and all is well.  If not, you need to unmount, re-fsck and try to 
revalidate the contents of individual files (this is where the digital 
signatures comes in handy).

>Also things like bubbling up to userspace.. If there is an
>unrecoverable read error in a file found during operation or an
>automated scan, it should show up in syslog with some working complete
>path to the file (as canonical as the fs can provide), and hopefully
>an offset to the error. Then my package manager could see if this is a
>file replaceable out of a package or if it's user data... If it's user
>data, my backup scripts can check the access time on the file and
>silently restore it from backup if the file hasn't changed. ... only
>leaving me an email "Dear operator, I saved your butt yet again
>--love, mr computer"
>  
>
Good idea, but we don't have that reverse mapping at hand for most file 
systems.

>And finally operator policy.. I'd like corrupted user files to become
>permission denied until I run some command to make the accessible,
>don't let me hang my apps trying to access them..
>  
>

