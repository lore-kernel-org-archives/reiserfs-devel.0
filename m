From: Hans Reiser <reiser@namesys.com>
Subject: Re: Scrambled Files
Date: Wed, 24 Apr 2002 03:02:54 +0400
Message-ID: <3CC5E81E.7080903@namesys.com>
References: <20020423210501.GA28270@willow.seitz.com> <20020423214642.GI7481@ariel.karmak.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Carmack <karmak@karmak.org>
Cc: Ross Vandegrift <ross@willow.seitz.com>, reiserfs-list@namesys.com

Michael Carmack wrote:

>On Tue, Apr 23, 2002 at 05:05:01PM -0400, Ross Vandegrift wrote:
>  
>
>>	Files all over the system have been scrabled - replaced with
>>garbage text, other executables, sections of data files.  There doesn't
>>seem to be a pattern to the file corruption.  There are no messages in
>>the logs.
>>    
>>
>
>I've read about this before, and it's something I've been meaning to
>ask about but never quite got around to. IIRC this is related to the
>tail-packing feature of reiserfs, and there's not a whole lot that can
>be done to salvage data once it's corrupted. Here are some questions
>that maybe the reiser developers can answer:
>
>1. Is it correct that this corruption is due to tail-packing?
>
If you crash while writing, garbage possibly appears in the file being 
written to.  Chris is looking at improving this with ordered writes, but 
there is a performance cost for it.  There are those who say it can be 
done without performance cost in V3 by ordering writes.  They have not 
yet produced a patch for which this is true, but it won't amaze me if 
they do so eventually.

reiser4 will fix this without much performance cost.

I think tails have nothing to do with it.  Probably the files that are 
all tails have no corruption at all, because they are journaled.  

If you want to be able to crash while doing an OS upgrade, and not have 
a hosed system, you must have transactions (or take a snapshot before 
doing it).  No FS currently supports transactions, but reiser4 will.

>
>2. Is the corruption in any way deterministic? For example, does
>   it only affect files that have been modified since the last
>   sync, or perhaps files that are in the process of being modified 
>   at the time the system goes down?
>
>3. If a reiserfs partition is mounted with the notail option, will 
>   it protect against this kind of corruption? How about mounting
>   with sync instead of notail?
>
>4. Is it possible to specify notail in /etc/fstab for the root 
>   partition? I seem to recall reading something along the lines
>   of: "It is not enough to simply specify notail in /etc/fstab
>   for the root partition, because notail is only valid for the
>   initial mount (i.e. mount -o,remount / will not pick up notail)."
>   Is this true? If so, how can one turn on notail for the root 
>   partition?
>
>5. Are there any performance hits (other than wasted disk space) 
>   as a result of turning on notail? I don't mind trading drive
>   space for reliability, but speed is important to me. What exactly
>   are the consequences of specifying notail?
>
>These are important questions for me, as I am currently using reiserfs
>exclusively on all of my machines. I've been doing network backups pretty
>religiously, but there's always this bit of apprehension in the back of 
>my mind for some time about losing data if a machine just happens to die
>unexpectedly.
>
>Thanks,
>m.
>
>
>
>
>  
>



