From: <pcg@goof.com ( Marc) (A.) (Lehmann )>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 23:44:19 +0200
Message-ID: <ac1gjn$70k$2@main.gmane.org>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <3CE41796.4030404@namesys.com> <200205161723.42672.kuba@mareimbrium.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205161723.42672.kuba@mareimbrium.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kuba Ober <kuba@mareimbrium.org>
Cc: reiserfs-list@namesys.com

On Thu, May 16, 2002 at 05:23:42PM -0400, Kuba Ober <kuba@mareimbrium.org> wrote:
> What I'm thinking of is this:
> to the user, which most users w/o intimate filesystem knowledge won't be able 
> to answer at all?

Unix traditionally wasn't aimed at the point-and-click users without
knowledge.

> Looking at this list, what people want is to get their data 
> back, as much as possible. They never want to get less than that. Why bother 
> asking?

Users who know nothing can still be told to just press "y". Even better,
somebody with some knowledge about the filesystem (and the contents!)
layout can often do better with an interactive fsck (see ext2fs).

I don't think it makes sense to enhance the dumb-user-mode while at the same
time keeping informed users from working properly.

> that is what many unsuspecting users actually do. It should simply disregard 
> read errors and try using whatever data there is in ok-read blocks.

It should actually ask the user wether she wants the block to be repaired
(if possible), or permanently marked defect.

> I don't think that asking too many questions is worth it. He who runs fsck in 
> "fix" mode wants his data back (whatever is left of it).

Thats a big mistake. He who runs fsck wants to recover as much data as
possible. Sometimes maybe more than fsck alone can do.

> recovery stuff should be w/o questions in my opinion. At least that's what 
> I'd expect all fsck's to do.

for some strange reason no fsck behaves like that.

-- 
      -----==-                                             |
      ----==-- _                                           |
      ---==---(_)__  __ ____  __       Marc Lehmann      +--
      --==---/ / _ \/ // /\ \/ /       pcg@goof.com      |e|
      -=====/_/_//_/\_,_/ /_/\_\       XX11-RIPE         --+
    The choice of a GNU generation                       |
                                                         |
