From: Michael Carmack <karmak@karmak.org>
Subject: Re: Scrambled Files
Date: Tue, 23 Apr 2002 21:46:42 +0000
Message-ID: <20020423214642.GI7481@ariel.karmak.org>
References: <20020423210501.GA28270@willow.seitz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020423210501.GA28270@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Vandegrift <ross@willow.seitz.com>
Cc: reiserfs-list@namesys.com

On Tue, Apr 23, 2002 at 05:05:01PM -0400, Ross Vandegrift wrote:
> 
> 	Files all over the system have been scrabled - replaced with
> garbage text, other executables, sections of data files.  There doesn't
> seem to be a pattern to the file corruption.  There are no messages in
> the logs.

I've read about this before, and it's something I've been meaning to
ask about but never quite got around to. IIRC this is related to the
tail-packing feature of reiserfs, and there's not a whole lot that can
be done to salvage data once it's corrupted. Here are some questions
that maybe the reiser developers can answer:

1. Is it correct that this corruption is due to tail-packing?

2. Is the corruption in any way deterministic? For example, does
   it only affect files that have been modified since the last
   sync, or perhaps files that are in the process of being modified 
   at the time the system goes down?

3. If a reiserfs partition is mounted with the notail option, will 
   it protect against this kind of corruption? How about mounting
   with sync instead of notail?

4. Is it possible to specify notail in /etc/fstab for the root 
   partition? I seem to recall reading something along the lines
   of: "It is not enough to simply specify notail in /etc/fstab
   for the root partition, because notail is only valid for the
   initial mount (i.e. mount -o,remount / will not pick up notail)."
   Is this true? If so, how can one turn on notail for the root 
   partition?

5. Are there any performance hits (other than wasted disk space) 
   as a result of turning on notail? I don't mind trading drive
   space for reliability, but speed is important to me. What exactly
   are the consequences of specifying notail?

These are important questions for me, as I am currently using reiserfs
exclusively on all of my machines. I've been doing network backups pretty
religiously, but there's always this bit of apprehension in the back of 
my mind for some time about losing data if a machine just happens to die
unexpectedly.

Thanks,
m.


