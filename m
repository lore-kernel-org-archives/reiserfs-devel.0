From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Tue, 01 Aug 2006 11:44:32 -0500
Message-ID: <44CF84F0.8080303@slaphack.com>
References: <200607312314.37863.bernd-schubert@gmx.de>	 <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>	 <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154446189.15540.43.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Alan Cox wrote:
> Ar Maw, 2006-08-01 am 16:52 +0200, ysgrifennodd Adrian Ulrich:
>> WriteCache, Mirroring between 2 Datacenters, snapshotting.. etc..
>> you don't need your filesystem beeing super-robust against bad sectors
>> and such stuff because:
> 
> You do it turns out. Its becoming an issue more and more that the sheer
> amount of storage means that the undetected error rate from disks,
> hosts, memory, cables and everything else is rising.

Yikes.  Undetected.

Wait, what?  Disks, at least, would be protected by RAID.  Are you 
telling me RAID won't detect such an error?

It just seems wholly alien to me that errors would go undetected, and 
we're OK with that, so long as our filesystems are robust enough.  If 
it's an _undetected_ error, doesn't that cause way more problems 
(impossible problems) than FS corruption?  Ok, your FS is fine -- but 
now your bank database shows $1k less on random accounts -- is that ok?

> There has been a great deal of discussion about this at the filesystem
> and kernel summits - and data is getting kicked the way of networking -
> end to end not reliability in the middle.

Sounds good, but I've never let discussions by people smarter than me 
prevent me from asking the stupid questions.

> The sort of changes this needs hit the block layer and ever fs.

Seems it would need to hit every application also...
