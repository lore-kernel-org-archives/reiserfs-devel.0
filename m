From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: 13 Feb 2003 17:49:16 -0500
Message-ID: <b2h7dc$ipp$1@satsuki.furryterror.org>
References: <3E4AA902.86F15815@interface-ag.com>
Return-path: <reiserfs-list-return-12747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <3E4AA902.86F15815@interface-ag.com>,
Dirk Schenkewitz  <Dirk.Schenkewitz@interface-ag.com> wrote:
>For me, it was alarming enough seeing ext3 drop the journal. In fact,
>THAT was the point where I went to investigate in other directions
>instead of blaming the filesystem. 

The kernel block device messages complaining about I/O errors from the
device aren't sufficient to tell you that there is a serious problem?
Or was this device silently corrupting data without reporting errors?

>The only problem is, that putting a bad drive to eternal rest
>might not solve the problem, as long as the REASON for the drive gone
>bad stays uncovered. (I had that said drive in use for less than 4
>months (if my memory servers, er, serves my well) - it was like new.

I've had disks that were DOA (literally--Medium Errors during
partitioning and mke2fs, followed by mechanical noises and total failure
in a matter of a few minutes).  I've had several disks that failed a
week or two after first installation.  

The M in MTBF is Mean, not Maximum or Minimum.  For every disk that
lasts 10 years or more, there's an equal and opposite disk that dies
within a few minutes.

>Hans Reiser wrote (in response to Anders Widman):
>> If we handle the journal block error without downtime, the user will 
>> never chuck the hard drive, and that is bad in the longterm.
>
>Not agreed, unless you continue without a warning.

I'd prefer to continue in read-only mode, and refuse further read-write
mounts with an error until the filesystem is fscked.  I really like
systems that can still boot and let me (attempt to) run diagnostic
tools even when they're otherwise really unhealthy.  I don't care if
recently written data is corrupt or missing--I probably didn't write to
the diagnostic tools within the last journal interval, and if the
filesystem is read-only I can't make any metadata corruption worse.

I would think that most people notice that something's wrong if they
can't write to their filesystems any more.  I certainly wouldn't want
the filesystem to be modified if there's something known to be wrong
with the metadata.  But if I can't read any of the data at all because
some tiny part of it is suspicious, I just get annoyed.  :-P

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
