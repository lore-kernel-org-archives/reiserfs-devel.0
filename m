From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Thu, 10 Oct 2002 16:58:54 +0200
Message-ID: <20021010165854.4381ed7e.philippe.gramoulle@mmania.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>
	<001b01c26fff$26d23850$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001b01c26fff$26d23850$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: darren <teodarren@myrealbox.com>
Cc: reiserfs-list@namesys.com


Hi,

On Thu, 10 Oct 2002 09:48:34 +0800
"darren" <teodarren@myrealbox.com> wrote:

  |  Hi all,
  |  
  |  I was just wondering if I should spend $$ (my company's of cos) on a
  |  NetApp filer...
  |  
  |  OR
  |  
  |  I just get one of the Dell 3650 doing nothing in the corner with RAID5
  |  and run Samba as a fileserver?
  |  
  |  Anyone got any benchmarks to compare the two?
  |  
  |  Is NetApp as good as its advertised?

We switched from NetApp to DELL ( PowerVault 210S ) mainly because of the $$ :o)

NetApp are really good but really expensive as well.So it depend how much value
you give to your data.

Netapp as well have tons of features that  linux boxes +PV210S can't do :Clustering
volume copy, out out the box snapshots,etc..

  |  
  |  Any comments on this setup is welcomed

Now i think DELL realease their 220S with 14 disks in a shelf so that would have the bang
for your bucks. On the otherside, NetApp comes with a very nice , proprietary , OS that's quite
simple to use.

So best price/performance => DELL
If you have unvaluable data => NetApp (+ backup :o)

  |  
  |  Regards
  |  Darren
  |  


Philippe.
