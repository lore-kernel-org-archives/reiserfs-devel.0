From: Carlos Rodrigues <rcarlos@moredata.pt>
Subject: Re: [Fwd: Problems]
Date: Sun, 23 Jun 2002 17:41:48 +0100
Message-ID: <3D15FA4C.4080501@moredata.pt>
References: <3D136574.7090607@moredata.pt> <20020621214414.A947@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010102050503070808090107"
Return-path: <reiserfs-list-return-10804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

--------------010102050503070808090107
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

i run the "reiserfsck --check" with log, the file attach is the report, 
when i run the --rebuild-tree i wil lose my data ?

i've the last version of reiserfs tools "reiserfsprogs 3.x.1b", this is 
the last, right ?

Thanks

Oleg Drokin wrote:

>Hello!
>
>   Yes, reiserfsck --rebuild-tree should resolve your problems
>   (run reiserfsck --check first and report us the output before
>    proceeding with --rebuild-tree, though).
>   Upgrade to latest version of reiserfsprogs first.
>
>   Ah, and please avoid writing your e-mail in HTML at least fo reiserfs lists.
>   Thank you.
>
>Bye,
>    Oleg
>On Fri, Jun 21, 2002 at 06:42:12PM +0100, Carlos Rodrigues wrote:
>
>>>From - Thu Jun 20 11:32:12 2002
>>X-Mozilla-Status2: 00000000
>>Date: Thu, 20 Jun 2002 11:32:11 +0100
>>From: Carlos Rodrigues <rcarlos@moredata.pt>
>>User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9) Gecko/20020412 Debian/0.9.9-6
>>X-Accept-Language: en
>>To:  reiser@namesys.com,  vs@namesys.botik.ru
>>CC:  reiserfs-list@namesys.com
>>Subject: Problems
>>
>
>
>
>


-- 
Carlos Rodrigues
<http://www.moredata.pt/%7Ercarlos> MoreData - Sistemas de Informa??o, 
Lda <http://www.moredata.pt>



--------------010102050503070808090107
Content-Type: text/plain;
 name="reisercheck.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reisercheck.log"

bad_indirect_item: block 18693: item 38073 320454 0x2878001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 384 to the block 1750940 which is in tree already
bad_indirect_item: block 18693: item 38073 320454 0x2878001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 385 to the block 1750941 which is in tree already
bad_indirect_item: block 18693: item 38073 320454 0x2878001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 968 to the block 1915638 which is in tree already
bad_indirect_item: block 18693: item 38073 320454 0x2878001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 969 to the block 1915639 which is in tree already
bad_indirect_item: block 18706: item 38073 320454 0x5000001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 940 to the block 3591752 which is in tree already
bad_indirect_item: block 18706: item 38073 320454 0x5000001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 941 to the block 3591753 which is in tree already
bad_indirect_item: block 18709: item 38073 320454 0x57e8001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 462 to the block 3594991 which is in tree already
bad_indirect_item: block 18709: item 38073 320454 0x57e8001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 463 to the block 3594992 which is in tree already
bad_indirect_item: block 18709: item 38073 320454 0x57e8001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 984 to the block 3595601 which is in tree already
bad_indirect_item: block 18709: item 38073 320454 0x57e8001 IND (1), len 4048, location 48 entry count 0, fsck need 0, format new has a pointer 985 to the block 3595602 which is in tree already
bad_indirect_item: block 18784: item 38073 354332 0x1 IND (1), len 612, location 1684 entry count 0, fsck need 0, format new has a pointer 12 to the block 667013 which is in tree already
bad_indirect_item: block 18784: item 38073 354332 0x1 IND (1), len 612, location 1684 entry count 0, fsck need 0, format new has a pointer 13 to the block 667019 which is in tree already
bad_indirect_item: block 18784: item 38073 354332 0x1 IND (1), len 612, location 1684 entry count 0, fsck need 0, format new has a pointer 76 to the block 669001 which is in tree already
bad_indirect_item: block 18784: item 38073 354332 0x1 IND (1), len 612, location 1684 entry count 0, fsck need 0, format new has a pointer 77 to the block 669046 which is in tree already
bad_indirect_item: block 18784: item 38073 354332 0x1 IND (1), len 612, location 1684 entry count 0, fsck need 0, format new has a pointer 94 to the block 669166 which is in tree already
bad_indirect_item: block 18784: item 38073 354332 0x1 IND (1), len 612, location 1684 entry count 0, fsck need 0, format new has a pointer 95 to the block 669228 which is in tree already
free block count 1876953 mismatches with a correct one 1876969. 
on-disk bitmap does not match to the correct one. 16 bits differ

--------------010102050503070808090107--

