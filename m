From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 16:33:40 +0300
Message-ID: <3E5F6534.70108@namesys.com>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281511.56997.liviu.voicu@huji.ac.il> <20030228141316.J24291@humilis> <200302281519.58013.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302281519.58013.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Nicing a compile to -10 should be expected to make your computer 
unusable.  Compiles are resource intensive, and if they have priority, 
then nothing should be left for anything else.  I don't know why your 
activity works for ext3, maybe ext3 is usable in this circumstance 
because it makes you wait more for IO?

-- 
Hans


