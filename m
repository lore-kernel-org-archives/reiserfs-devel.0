From: Ric Wheeler <ric@emc.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Tue, 01 Aug 2006 14:21:33 -0400
Message-ID: <44CF9BAD.5020003@emc.com>
References: <200607312314.37863.bernd-schubert@gmx.de>	 <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>	 <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain>
Reply-To: ric@emc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751763AbWHASVm@vger.kernel.org>
In-Reply-To: <1154446189.15540.43.camel@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Alan Cox wrote:
> Ar Maw, 2006-08-01 am 16:52 +0200, ysgrifennodd Adrian Ulrich:
> 
>>WriteCache, Mirroring between 2 Datacenters, snapshotting.. etc..
>>you don't need your filesystem beeing super-robust against bad sectors
>>and such stuff because:
> 
> 
> You do it turns out. Its becoming an issue more and more that the sheer
> amount of storage means that the undetected error rate from disks,
> hosts, memory, cables and everything else is rising.


I agree with Alan despite being an enthusiastic supporter of neat array 
based technologies.

Most people use absolutely giant disks in laptops and desktop systems 
(300GB & 500GB are common, 750GB on the way). File systems need to be as 
robust as possible for users of these systems as people are commonly 
storing personal "critical" data like photos mostly on these unprotected 
drives.

Even for the high end users, array based mirroring and so on can only do 
so much to protect you.

Mirroring a corrupt file system to a remote data center will mirror your 
corruption.

Rolling back to a snapshot typically only happens when you notice a 
corruption which can go undetected for quite a while, so even that will 
benefit from having "reliability" baked into the file system (i.e., it 
should grumble about corruption to let you know that you need to roll 
back or fsck or whatever).

An even larger issue is that our tools, like fsck, which are used to 
uncover these silent corruptions need to scale up to the point that they 
can uncover issues in minutes instead of days.  A lot of the focus at 
the file system workshop was around how to dramatically reduce the 
repair time of file systems.

In a way, having super reliable storage hardware is only as good as the 
file system layer on top of it - reliability needs to be baked into the 
entire IO system stack...

ric

