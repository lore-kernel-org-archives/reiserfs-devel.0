From: Hans Reiser <reiser@namesys.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Wed, 04 Jun 2003 13:40:49 +0400
Message-ID: <3EDDBEA1.6040708@namesys.com>
References: <20030523192440.7221.qmail@web40015.mail.yahoo.com>	 <3EDCDFAA.5050802@namesys.com> <1054703871.3739.68.camel@arabia.home.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054703871.3739.68.camel@arabia.home.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Cc: Kevin Bealer <kevinbealer@yahoo.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, reiserfs-list@namesys.com

So if I understand right, the level is determined by what the key is.  
Suppose that for key K the determined level is 3, but there are no other 
records in the tree?  Is K then stored at a node at level 1 until such 
time as a level 1 key is created for it to be attached to, or does one 
create empty level 1 and level 2 nodes?

-- 
Hans


