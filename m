From: Hans Reiser <reiser@namesys.com>
Subject: Re: where is the journal kept?
Date: Tue, 16 Aug 2005 12:59:10 -0700
Message-ID: <4302458E.9070604@namesys.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>	 <20050815125025.GA29390@tranquility.scriptkitchen.com>	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>	 <4300A603.2050602@namesys.com>	 <d9a6586e05081509195017d679@mail.gmail.com>	 <4300D240.7010109@namesys.com> <d9a6586e0508151108431fabba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d9a6586e0508151108431fabba@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Shawn Rutledge wrote:

>On 8/15/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
>  
>
>>I must be misunderstanding something. Half of reiser4' complexity is about to make disk writes and reads
>>more sequential to decrease number of hard disk head seeks.
>>IMHO, filesystem for storage devices which do not have moving mechanical parts can go better without such code.
>>    
>>
You exaggerate.

Reiser4 does a very nice job of packing the tree tightly, which is
independent of seeks.  Ditto for compression plugin.
He merely needs to ignore some code, he is not harmed by it.  If he
wants to write a new block allocator, sure, why not, we have allocator
plugins yes?   His will just be simpler.....

>
>Well so far the choices are FAT and EXT2, both of which have
>well-known limitations.  I'm trying to get set up to compile things on
>the zaurus, and installing gcc requires symlinks so I had to quit
>using FAT.
>
>JFFS2 is used for the internal flash but is overkill for a CF card (as
>well as not designed for it, and thus would require a lot of changes
>to make it possible).
>
>What I want is an FS that never loses data because of a crash (writes
>should be atomic) and doesn't ever need to be fsck'd, yet still is
>very fast and caches writes and accumulates writes, so that repeated
>writes to the same file result in only one physical write.
>
>
>  
>

