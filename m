From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: assembling a file out of debugreiserfs's map
Date: Mon, 31 May 2004 11:16:09 +0400
Message-ID: <1085987769.1198.31.camel@tribesman.namesys.com>
References: <20040528165533.GA12618%alexy.khrabrov@setup.org>
	 <20040528192320.GA14111%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040528192320.GA14111%alexy.khrabrov@setup.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexy Khrabrov <list+reiserfs@setup.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Fri, 2004-05-28 at 23:23, Alexy Khrabrov wrote:
> I realized how IND chains lead to more blocks, so the question remaining
> is, whether it can be assembled automatically?  Why are they repeated
> several times with seemingly the same block number/counts, and what does
> the fractioned one mean,
> 
> block 1271, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
> 57 pointers
> [ 2055746(9) 2055756(48)]
> 
> as compared to
> 
> block 1270, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
> 814 pointers
> [ 2054932(814)]
> 
> -- also note, that the last chain for p5270916.jpg,
> 
> block 8002, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
> 57 pointers
> [ 2055746(9) 2055756(48)]
> 
> mentioned the same block number 8002 which the safefly recovered p5270917.jpg
> mentions:
> 
> block 8002, item 0: 2572 2574 0x1 IND (1), len 3348, location 476 entry count 0, fsck need 0, format new
> 837 pointers
> [ 2055804(837)]
> 

Reiserfs does not keep metadata at the same place all the time. It keeps
metadata in the tree, which rebalances whenever one changes filesystem.
So, file's metadata migrates even though you did not touch that file for
a long time.
So, the trick in recovering files in from metadata is to choose proper
sequence of metadata given that there might by a lot of them. They may
overlap also. So, it is not very easy to automate such file recovering.

> Isn't there a tool/script to assemble those chains into a file by, um,
> a computer?  :)  I mean I'd hack a python script to do dd ... >> file,
> but I bet 1000 rubles/30 euros/40 dollars it exists somewhere!

I am not aware of any

