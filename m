From: Anders Widman <andewid@tnonline.net>
Subject: Re: [PATCH] various allocator optimizations
Date: Tue, 11 Mar 2003 23:39:19 +0100
Message-ID: <6241720265.20030311233919@tnonline.net>
References: <1047400482.8215.312.camel@tiny.suse.com>
 <20030311194205.A4493@namesys.com>  <1047403968.8219.337.camel@tiny.suse.com>
 <3E6E584D.4080809@namesys.com> <1047421551.8219.448.camel@tiny.suse.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1047421551.8219.448.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

> On Tue, 2003-03-11 at 16:42, Hans Reiser wrote:

>> Chris, don't you think the right answer would be to take zam's resizer
>> and make a defragmenter out of it?

> Yes and no, for a defrag program to fix things we'd have to agree on an
> optimal layout ;-)  Also it assumes the machine has idle time when a
> defragment cycle is possible.  For many servers this is entirely
> untrue...the oracle boxes I ran didn't have a spare second for something
> like a defrag.

True,  But  then the server is to heavily loaded and you have probably
other issues you need to attend to?

> We can all agree that fragmentation is bad, but the real question is how
> do we group the blocks.  Lets pretend for a minute that fragmentation
> isn't an issue at all, and our allocator is perfect.

If that only was true :)

> The optimal grouping for reading/writing files is to have the files you
> are going to read/write together in the same area of the disk.

> The current default uses the start of the disk as a starting point for
> each new file.  This roughly translates to files that are created
> together end up in the same part of the disk.  As long as you always
> access files in roughly the same order that you create them, it performs
> pretty well.

> But if a process creates dirA/file1 and then dirB/file2, file1 and file2
> are going to be together on the disk.  If file1 tends to be used along
> with all the other files in dirA, performance will suffer because we've
> got to seek from all the other files in dirA over to file1.

> And this is what we see over time, our performance decreases as people
> add files onto their directories and shift things around.  Especially on
> multi-user systems files are rarely accessed in the same order they were
> created.

> What we need is a knob for the admin to use to suggest 'I'm probably
> going to access these files together'.  The only one I can think if is
> the directory itself, but it isn't optimal either since subdirectories
> are frequently accessed with their parents and with other subdirs.

> -chris

Would  it not be possible to have a daemon running and collecting data
on   how   files  are  being  accessed  and  written.  Then  either  a
defragmenter or the fs itself can optimize the on-disk layout?

Also,  would  it  be  possible  to  implement  some  form  of  command
reordering  in  the  fs? It might increase performance where there are
multiple accesses to smaller files on the same volume...

//Anders


   



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

