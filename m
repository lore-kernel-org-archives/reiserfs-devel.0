From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Wed, 05 Jun 2002 23:13:31 +0200
Message-ID: <3CFE7EFB.6080203@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023157228.31475.38.camel@tiny> 	<3CFC33F2.7080009@mb.tu-ilmenau.de> <1023196345.31682.81.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/04/2002 03:12 PM, Chris Mason wrote:
 > On Mon, 2002-06-03 at 23:28, Manuel Krause wrote:
 >
 >
 >>So, VMware is stable with it, too, on my well known "heavy-private-test"
 >>of it (running Norton SpeedDisk at least twice within a most recent
 >>VMware Win98). It doesn't show greatly different timings than to my
 >>setup before though having a different disk i/o pattern (due to the
 >>missing aa patches)... and me having a reduced RAM from 512to256MB at
 >>the moment. And I should be honest to say I can't give exact timings as
 >>the important disk contents changed during last weeks. But the
 >>disk-access-times/related-to-the-content are definitively _not_ higher
 >>than before!
 >
 >
 > same speed on 1/2 the ram isn't bad ;-)
 >
[...]
Don't know where to reply best...

Hi, again!

I want to make some more comments on my latest words.

As I said I first used the data=journal mode and got nice timings. O.k. 
I really think after that "revision" my previous kernel setup wasn't 
that well configured as I thought and felt. Long time degression?!

I really had the reiserfs messages in my logs that it explicitely used
this mode. The only problem I obviously had, so far, was to distinguish 
the mount options at darkest night: data=logging is no mount-option but 
the description "data-logging", the mount option for it is data=journal
-- Passing rootflags=data=journal in lilo.conf and data=logging in fstab 
results in an uncontrollable kernel ;-) Huh!
Sorry, for my thoughtless testing. But my posted timings are quite 
relieble on here.

Concerning VMware the "same speed on 1/2 RAM" results are even more
impressing as VMware seems to buffer it's memory contents to /tmp/... fs 
again since I reduced the RAM. With 512MB it didn't seem to need this 
method usually.

The data=ordered mode saves 1..2secs from of my previously posted load
times for NS7 and OOo-1.0 and seems to be stable itself in "everydays 
usage" and for my VMware sessions, too. I didn't test the 
"crash->no-garbage-in-files" case and the more recent 
03-beta-data-logging-6.diff, yet.

I was extraordinary glad to see the explicit wording of the mounted 
partition in the logs we missed for so long time!

Thanks for your help,

Manuel


