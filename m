From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [OT] Re: ReiserFS problems
Date: Fri, 8 Aug 2003 16:40:26 +0400
Message-ID: <16179.39482.567511.102156@laputa.namesys.com>
References: <20030806182055.A28562@bitwizard.nl>
	<3F3252A4.4010104@namesys.com>
	<20030807181227.GA23303@matchmail.com>
	<200308081018.31525.russell@coker.com.au>
	<3F338990.3040506@g-house.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F338990.3040506@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <evil@g-house.de>
Cc: reiserfs-list@namesys.com

Christian Kujau writes:
 > Russell Coker wrote:
 > > system for storing a file-system image.  If you use an XOR encryption method 
 > > it won't even hurt performance either.  :-#
 > 
 > sorry to hop in here, but i don't understand why an algorithm like "XOR" 
 > is named "encryption" at all. isn't it that another XOR operation just 
 > delivers the cleartext again?

"XOR encryption" xors consequent bytes of data being encrypted (in our
case blocks of loop device) with consequent bytes of user supplied key
(password). For all reasonable sizes of the key, this is surely only
marginally safer than no encryption at all, because, for instance, file
block devices usually contains a lot of zero-filled blocks, and xoring
key with zeroes will give you key.

 > 
 > a     b             a
 > 
 > 0 XOR 1 = 1 XOR b = 0
 > 1 XOR 0 = 1 XOR b = 1
 > 1 XOR 1 = 0 XOR b = 1
 > 0 XOR 0 = 0 XOR b = 0
 > 
 > 
 > but i don't have to explain that to you...
 > 
 > thanks,
 > Christian.

Nikita.

 > 
 > -- 
 > BOFH excuse #179:
 > 
 > multicasts on broken packets
 > 
