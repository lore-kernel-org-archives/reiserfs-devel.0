From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: fsck.reiser4 problem
Date: Sun, 29 Aug 2004 10:51:29 +0200
Message-ID: <41319911.4040308@dermichi.com>
References: <412E6EFC.3070600@dermichi.com>	<4130FDD6.1090906@dermichi.com> <20040829085421.4c926871.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040829085421.4c926871.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: ReiserFS List <reiserfs-list@namesys.com>

>>- 2.6.9-rc1-mm1 has a bug that affects all filesystems (pointed out 
>>earlier today). so don't use if you love your data ;)
> Can you tell us more about this bug?
> (I'm using 2.6.9-rc1-mm1 and would like to know, what will happen ;) )
See:
http://marc.theaimsgroup.com/?l=linux-kernel&m=109360433916523&w=2
and the mail in the reiserfs-list by Christian Mairhuber, subject "Re: 
reiserfs3 filesystem corruption?"
the bottom line is: there are problems with files that are exactly the 
size of a multiple of 4096, they are truncated by 4096 bytes...

Michael
