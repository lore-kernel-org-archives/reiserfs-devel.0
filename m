From: Bingner Sam J Contractor CAF CSS/SCHE <Sam.Bingner@hickam.af.mil>
Subject: RE: back up to disk
Date: Tue, 15 Oct 2002 21:17:38 -0000
Message-ID: <A6B0BFA3B496A24488661CC25B9A0EFA333CF6@himl07.hickam.pacaf.ds.af.mil>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11700-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Russell Coker' <bofh@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

can anybody say SAN?

SAN:  Acronym: Storage Area Network

This looks like it is just a SAN, and a little software to show when the
same data is written twice and reference the first instance instead of
writing it again...  I suspect it could use any filesystem on the drives you
wanted...

	Sam Bingner
	PACAF CSS/SCHE

-----Original Message-----
From: Russell Coker [mailto:bofh@coker.com.au]
Sent: Tuesday, October 15, 2002 11:06 AM
To: ReiserFS
Subject: [reiserfs-list] back up to disk


Here's an interesting article I just read.  It's just a device with a bunch
of 
ATA drives inside, up to 2T of storage.  Probably anyone here could produce 
something based on ReiserFS to compete with it...


Storage start-up Avamar Technologies is launching an appliance 
this week that it claims backs up network data more quickly and 
less expensively than tape. 
http://www.nwfusion.com/news/2002/1014avamar.html?net

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
