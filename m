From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Thu, 10 Oct 2002 19:53:38 +0200
Message-ID: <20021010195338.138dffcf.philippe.gramoulle@mmania.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>
	<001b01c26fff$26d23850$0101a8c0@bummer>
	<20021010165854.4381ed7e.philippe.gramoulle@mmania.com>
	<3DA5B971.3040400@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DA5B971.3040400@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: teodarren@myrealbox.com, reiserfs-list@namesys.com

Hi,

Yes, that's what i meant by "not *out of the box* snapshots".

We quite never played with LVM as it adds another software layer and i didn't feel
it was mature enough at the time we put everything in production but given the benefits
we might want to give it a try.

BTW, Hans, what you would recommand : LVM or EVMS ?

Thanks,

Philippe


On Thu, 10 Oct 2002 21:31:29 +0400
Hans Reiser <reiser@namesys.com> wrote:

  |  >Netapp as well have tons of features that  linux boxes +PV210S can't do :Clustering
  |   >volume copy, out out the box snapshots,etc..
  |   >
  |   Linux has snapshots if you use lvm, but it is true that  Netapp makes a 
  |   good product.
