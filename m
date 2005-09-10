From: Kyle Moffett <mrmacman_g4@mac.com>
Subject: Re: List of things requested by lkml for reiser4 inclusion (to review)
Date: Sat, 10 Sep 2005 00:51:42 -0400
Message-ID: <5FDA2C74-F923-4695-A1B8-4355D445C073@mac.com>
References: <200509091817.39726.zam@namesys.com> <4321C806.60404@namesys.com> <20050909185740.GA11923@infradead.org> <4321FCDA.60305@namesys.com>
Mime-Version: 1.0 (Apple Message framework v734)
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030446AbVIJEwV@vger.kernel.org>
In-Reply-To: <4321FCDA.60305@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, LKML <linux-kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Edward Shishkin <edward@namesys.com>

On Sep 9, 2005, at 17:21:30, Hans Reiser wrote:
>>  It's huge CPP abuse
> can you define what that means? and how abuse differs from cleverness?
> This code was not my idea, but it seemed more cleverness than abuse to
> me when I read it.

"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are, by
definition, not smart enough to debug it."
   -- Brian Kernighan

Sometimes cleverness can be even worse than ordinary abuse :-D.  If the
code gets added to the kernel, then it should be debuggable (or at least
easily comprehensible) by a significant chunk of kernel developers, or
it will cause more problems than it solves.  I think that a type-safe
list system _would_ be a good addition, but make sure you comment it
heavily enough to make it really obvious, even to those of us who are
less than brilliant (like myself).

Cheers,
Kyle Moffett

--
Simple things should be simple and complex things should be possible
   -- Alan Kay


