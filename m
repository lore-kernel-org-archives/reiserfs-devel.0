From: Anton Erofeevskij <ae@ap-plastic.ru>
Subject: Re: !?!
Date: Wed, 08 Jan 2003 12:33:10 +0500
Message-ID: <3E1BD436.7090200@ap-plastic.ru>
References: <3E1BCAE6.9000408@ap-plastic.ru> <200301080818.16061.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

Russell Coker wrote:

>On Wed, 8 Jan 2003 07:53, Anton Erofeevskij wrote:
>
>>in reiserfs filesystem
>>time cat sd1 | ./a.out > sd2
>>0.00user 0.05system 0:01.79elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
>>0inputs+0outputs (131major+43minor)pagefaults 0swaps
>>
>>in ext2 filesystem
>>time cat sd1 | ./a.out > sd2
>>0.00user 0.05system 0:00.95elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
>>0inputs+0outputs (131major+43minor)pagefaults 0swaps
>>
>
>Try mounting the ReiserFS file system with notail and it should perform a lot 
>better for such things.
>

mount -o notail

time no change !




