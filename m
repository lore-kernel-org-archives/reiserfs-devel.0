From: Christian Kujau <evil@g-house.de>
Subject: [OT] Re: ReiserFS problems
Date: Fri, 08 Aug 2003 13:29:20 +0200
Message-ID: <3F338990.3040506@g-house.de>
References: <20030806182055.A28562@bitwizard.nl> <3F3252A4.4010104@namesys.com> <20030807181227.GA23303@matchmail.com> <200308081018.31525.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308081018.31525.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Russell Coker wrote:
> system for storing a file-system image.  If you use an XOR encryption method 
> it won't even hurt performance either.  :-#

sorry to hop in here, but i don't understand why an algorithm like "XOR" 
is named "encryption" at all. isn't it that another XOR operation just 
delivers the cleartext again?

a     b             a

0 XOR 1 = 1 XOR b = 0
1 XOR 0 = 1 XOR b = 1
1 XOR 1 = 0 XOR b = 1
0 XOR 0 = 0 XOR b = 0


but i don't have to explain that to you...

thanks,
Christian.

-- 
BOFH excuse #179:

multicasts on broken packets

