From: Beni Cherniavsky <cben@users.sf.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 11 Apr 2004 02:42:02 +0300
Sender: news <news@sea.gmane.org>
Message-ID: <c5a0ns$dp7$1@sea.gmane.org>
References: <406EFB72.6000009@namesys.com> <20040404032233.86328.qmail@web25010.mail.ukl.yahoo.com> <87u100e58d.fsf@uhoreg.ca> <200404040631.50269.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404040631.50269.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Christian Iversen wrote:
> On Sunday 04 April 2004 06:28, Hubert Chan wrote:
> 
>>>>>>>"Narcoleptic" == Narcoleptic Electron
>>>>>>><narcoleptic_electron@yahoo.co.uk> writes:
>>
>>[...]
>>
>>Narcoleptic> True; as long as everyone refers to the "metas" directory
>>Narcoleptic> properly (using an environment variable, for example, as
>>Narcoleptic> opposed to hard-coding the string "metas" anywhere), it
>>Narcoleptic> will be fine.
>>
>>Hmm.  Maybe have a /proc/fs/reiser4/metas file to query it?
>>(Environment variable seems fragile.)
> 
That's the only right (and feasible) way to export it from the kernel.
However it's purpose is to allow writing scripts that are portable 
accross different definitions and this is much easier with an 
environment variable (cat foo/$REISER4FS_METAS/rwx) than with a file
(cat foo/`cat /proc/fs/reiser4/metas`/rwx).  So people will surely
set an environment variable from the /proc file in some shell init file.
Not that standardazing the name of the environment variable should 
bother us now.

> 
> Good idea. Of course, I will be the first one to set it to "..." ;-)
> 
Note that changing the magic name (dynamically or even by recompiling) 
can create a confilict with an *exisiting* file on a reiserfs4 partition 
(the file could have been created when another name was magic).  The FS 
code should be ready to handle it, preferably giving some escape route 
way to access the colliding file (e.g. ``foo/my_metas/escape`` could 
give access to the file known as ``foo/my_metas`` before you changed the 
magic name to ``my_metas``).

