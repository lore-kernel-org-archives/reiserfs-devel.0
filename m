From: Alexy Khrabrov <list+reiserfs@setup.org>
Subject: Re: assembling a file out of debugreiserfs's map
Date: Fri, 28 May 2004 15:23:20 -0400
Message-ID: <20040528192320.GA14111%alexy.khrabrov@setup.org>
References: <20040528165533.GA12618%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040528165533.GA12618%alexy.khrabrov@setup.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


I realized how IND chains lead to more blocks, so the question remaining
is, whether it can be assembled automatically?  Why are they repeated
several times with seemingly the same block number/counts, and what does
the fractioned one mean,

block 1271, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
57 pointers
[ 2055746(9) 2055756(48)]

as compared to

block 1270, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]

-- also note, that the last chain for p5270916.jpg,

block 8002, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
57 pointers
[ 2055746(9) 2055756(48)]

mentioned the same block number 8002 which the safefly recovered p5270917.jpg
mentions:

block 8002, item 0: 2572 2574 0x1 IND (1), len 3348, location 476 entry count 0, fsck need 0, format new
837 pointers
[ 2055804(837)]

Isn't there a tool/script to assemble those chains into a file by, um,
a computer?  :)  I mean I'd hack a python script to do dd ... >> file,
but I bet 1000 rubles/30 euros/40 dollars it exists somewhere!

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
