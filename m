From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 02:17:13 +0200
Message-ID: <3CE44C09.4040607@netscape.net>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <3CE41796.4030404@namesys.com> <200205161723.42672.kuba@mareimbrium.org> <20020516214419.GE15774@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi '""pcg\"@goof.com ( Marc) (A.) (Lehmann )' and all others!

On 05/16/2002 11:44 PM, pcg@goof.com ( Marc) (A.) (Lehmann ) wrote:

> On Thu, May 16, 2002 at 05:23:42PM -0400, Kuba Ober <kuba@mareimbrium.org> wrote:
> 
>>What I'm thinking of is this:
>>to the user, which most users w/o intimate filesystem knowledge won't be able 
>>to answer at all?
>>
> 
> Unix traditionally wasn't aimed at the point-and-click users without
> knowledge.


Don't loose contact with reality. Nowadays things change very often. And 
  at least Linux has to be usable for a "traditional Win user" soon if 
it should exist in future.

> 
>>Looking at this list, what people want is to get their data 
>>back, as much as possible. They never want to get less than that. Why bother 
>>asking?
>>
> 
> Users who know nothing can still be told to just press "y". Even better,
> somebody with some knowledge about the filesystem (and the contents!)
> layout can often do better with an interactive fsck (see ext2fs).
> 
> I don't think it makes sense to enhance the dumb-user-mode while at the same
> time keeping informed users from working properly.
> 


It makes sense to improve all user modes (in docs and usability) AND all 
automatic modes possible depending on the distro. Pardon, what is an 
"informed" user? Someone who reads the Docs or someone who can decidedly 
type "Yes"... and make a repeat loop??

> 
>>that is what many unsuspecting users actually do. It should simply disregard 
>>read errors and try using whatever data there is in ok-read blocks.
>>
> 
> It should actually ask the user wether she wants the block to be repaired
> (if possible), or permanently marked defect.


Doesn't that really depend on the HW state <-> or can software reliably 
decide whether the info it gets is o.k. so far on Linux?? See the 
previous posts on the list.

> 
>>I don't think that asking too many questions is worth it. He who runs fsck in 
>>"fix" mode wants his data back (whatever is left of it).
>>
> 
> Thats a big mistake. He who runs fsck wants to recover as much data as
> possible. Sometimes maybe more than fsck alone can do.
> 


We all running "reiserfsck" want as much data back as possible and are 
in fear the FS has lost some things or is loosing things while running 
fsck (what is real with ext2 and vfat). What is a big mistake on 
reiserfs at least as it retrieves "mostly all" things possible. O.k. 
that point is inaccurate.

> 
>>recovery stuff should be w/o questions in my opinion. At least that's what 
>>I'd expect all fsck's to do.
>>
> 
> for some strange reason no fsck behaves like that.
> 


Yess. I agree on that opinion. The fixable things should pass without 
any question. Who knows the special missing inode, when it should be fixed?

Best wishes,

Manuel



