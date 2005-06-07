From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk <
 reiser4_block_count(super)
Date: Tue, 7 Jun 2005 13:01:11 +0200
Message-ID: <20050607130111.39bda1f2.reiser4@blinkenlights.ch>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
	<200506061255.22953.vitaly@namesys.com>
	<20050606203914.3271673f.reiser4@blinkenlights.ch>
	<200506071100.44749.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506071100.44749.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vitaly,

> there was a format change to work with encryption plugin in 
> -5 reiser4 patch. progs do not have its support yet. grub works 
> through the progs code so its the same problem, mkisofs is not 
> relevant here.

I don't think thats the problem:

It looks like a remount bug:
 See <20050607065750.4dd203b9.reiser4@blinkenlights.ch> (my other mail)


