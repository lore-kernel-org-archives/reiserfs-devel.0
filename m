From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions (solved!)
Date: Mon, 30 Jun 2003 02:31:03 +0200
Message-ID: <3EFF84C7.6090903@g-house.de>
References: <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de> <20030628115343.GA21256@namesys.com> <3EFD8317.9000009@g-house.de> <3EFD86FC.6060307@g-house.de> <20030628121843.GA21209@namesys.com> <3EFDB9AC.9030601@g-house.de> <20030629085411.GA11564@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030629085411.GA11564@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Oleg Drokin <green@namesys.com>

Oleg Drokin wrote:
> Good. Can you stress it for some time just to be sure?

i've done so, a kernel compile on a fresh reierfs finished with no 
errors, and in such a compile *a lot* of files are created/read, i guess 
the compile would horrible fail if there were corruptions in any of them.

and yes, if i ever stumble again over such an odd issue, i know your 
mail address :-[]

Thanks again for this bug hunting, i think many other 64bit users will 
be happy too.

Regards,
Christian.
-- 
BOFH excuse #274:

It was OK before you touched it.

