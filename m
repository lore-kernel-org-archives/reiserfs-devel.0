From: Hans Reiser <reiser@namesys.com>
Subject: Re: Hard disk crash and solution
Date: Thu, 23 Jan 2003 01:02:58 +0300
Message-ID: <3E2F1512.7030300@namesys.com>
References: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niek <Art@chello.nl>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

I forgot to say, thanks a lot for your detailed story.  It was helpful 
for me, I have only run fsck myself once (after I LVM'd my reiserfs 
partition and scragged the beginning of it containing the root 
directory, oh was that a misery to reconstruct by sorting through a 
bunch of unnamed files to be sure none of them were valuable).

Vitaly, I think we probably should have specific instructions for what 
to do if you destroy the beginning of the partition, and need to 
reconstruct only some of the bitmaps, it is the most common thing that 
people do (as opposed to disks doing) that requires fsck.  What do you 
think?

-- 
Hans


