From: Oleg Drokin <green@namesys.com>
Subject: Re: Error <-> Partition Correspondance [was Re: Corrupted/unreadable journal: reiser vs. ext3]
Date: Tue, 18 Feb 2003 09:54:14 +0300
Message-ID: <20030218095414.A16803@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <200302151551.12765.vitaly@namesys.com> <3E513B45.1010001@namesys.com> <3E5171BB.20509@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5171BB.20509@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, Feb 18, 2003 at 12:35:23AM +0100, Manuel Krause wrote:

> BTW, do the ReiserFS errors nowadays print out a usable partition 
> identification (like Chris actual data-logging patches perform at mount, 
> e.g.)?

Sometimes it does.

> I mostly always have 2 partitions with ReiserFS mounted, so -- is it 
> still meaningless to get an error message related to one of them in my logs?

It depends on what are the messages.

> I posted this circumstance some 3.6-ReiserFS levels ago and someone of 
> your team wanted to implement this after his task-list was done, IIRC.

Yes. I have a patch dated back to May 7th, 2002. But it was never
accepted for reason I don't remember already.
I will dig through my email, though. Probably I will give it another try.

Bye,
    Oleg
