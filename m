From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: software packaging and ReiserFS v4
Date: Mon, 8 Sep 2003 13:49:42 +0400
Message-ID: <16220.20662.840850.726458@laputa.namesys.com>
References: <20030903165409.GD4714@rahul.net>
	<3F565A8F.4010209@botz.org>
	<20030903213742.GA13146@rahul.net>
	<3F58D2CD.3050801@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F58D2CD.3050801@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: Bennett Todd <bet@rahul.net>, reiserfs-list@namesys.com

Grant Miner writes:
 > If you are making a packaging system, I recommend you do not allow 
 > scipts, since they open up a whole can of worms.  (They're impossible to 
 > invert, introduce security problems, make additional work for GUI 
 > package managers, and cause too many problems.)

You one has support for the user-level transactions in the underlying
storage (_all_ storage), then scripts will at least be
"invertible". More or less so, of course, sending packages to the
network is hard to reverse.

 > 

Nikita.
