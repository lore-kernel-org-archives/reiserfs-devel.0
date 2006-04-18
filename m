From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Yet another 2.6.16/reiser4 crash
Date: Tue, 18 Apr 2006 19:16:58 +0400
Message-ID: <1145373418.6291.36.camel@tribesman.namesys.com>
References: <3aa654a40604160035p6c81daf6vf5606c937c97cb0f@mail.gmail.com>
	 <1145364467.6291.31.camel@tribesman.namesys.com>
	 <3aa654a40604180639s363f6da9ob2f7440bc0c1691f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40604180639s363f6da9ob2f7440bc0c1691f@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Avuton Olrich <avuton@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Tue, 2006-04-18 at 06:39 -0700, Avuton Olrich wrote:
> On 4/18/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > Hello
> >
> > On Sun, 2006-04-16 at 00:35 -0700, Avuton Olrich wrote:
> > > Kernel: 2.6.16.3 with reiser4-for-2.6.16-2
> > > Compiler: GCC-4.1.0
> > >
> > > Notes: This caused the computer to not allow login, refuse to route
> > > network stuff, though I could see kernel messages still coming through
> > > (such as network traffic trying to get through).
> > >
> > > Any questions please ask. Thanks
> > >
> >
> > can you find a way to reproduce this bug reliably?
> 
> Sorry, I can't. This is actually a semi-production machine, which had
> been up from April 11th 5:35-April 15 22:58:32,  it has since been
> reverted back to 2.6.15.7-reiser4. Although I should have mentioned
> the only thing that is out of the ordinary about ecasound, which is
> referenced in the oops, is that is runs at SCHED_FIFO:50. That process
> runs 24 hours then is replaced by a new process (same program,
> different output filename) that runs another 24 hours, etc...
> 
> The write barrier got disabled on Apr 16 at 00:36:
> Apr 16 00:36:53 shapeshifter <4>reiser4[rsync(9828)]:
> disable_write_barrier
> (/usr/src/linux-stable/fs/reiser4/wander.c:233)[zam-1055]:
> Apr 16 00:36:53 shapeshifter WARNING: disabling write barrier
> 
> If you come up with something for me to test I will during the weekend.
> 

we hope to release quite substantial changes soon. Unfortunately, it is
not yet well debugged.

> While I'm writing and looking through my logs (2.6.15.7-reiser4):
> Apr 17 12:51:41 shapeshifter <4>reiser4[ent:md0!(1048)]:
> capture_anonymous_jnodes
> (/usr/src/linux-stable/fs/reiser4/plugin/file/file.c:1348)[nikita-33281]:
> Apr 17 12:51:41 shapeshifter WARNING: anonymous jnode in writeback:
> (13332253 134231)
> --

this is safe.

> avuton
> --
>  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
> 

