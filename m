From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 15:30:33 -0400
Message-ID: <40A51E59.5060708@suse.com>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es> <1084439945.14090.6209.camel@tribesman.namesys.com> <20040514173227.5b0541b5.turtle.power@wanadoo.es> <200405141655.i4EGtrAT007250@turing-police.cc.vt.edu> <20040514194040.22389128.turtle.power@wanadoo.es> <1084557009.3263.7.camel@localhost.localdomain> <20040514202627.18ddc7b2.turtle.power@wanadoo.es>            <20040514184823.GG18086@schnapps.adilger.int> <200405141906.i4EJ6gZF030124@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405141906.i4EJ6gZF030124@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Andreas Dilger <adilger@clusterfs.com>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Valdis.Kletnieks@vt.edu wrote:
> On Fri, 14 May 2004 12:48:23 MDT, Andreas Dilger said:
> 
> 
>>Hmm, why wouldn't reiserfs_statfs() just use that number for the "in use"
>>inodes in the first place?  Sadly, the statfs() interface is broken in
>>the sense that it contains "total" inodes and "free" inodes instead of
>>"in use" inodes, but it shouldn't be difficult to just subtract the
>>number of in-use inodes from 2^32-1 and stick that into the "free" field
>>so that when user-space does the reverse it gets the right number.
> 
> 
> If you get a multi-terabyte filesystem that contains more than 2^32-1 files,
> things will get very pear-shaped....

If you get a ReiserFS v3 filesystem to contain more than 2^32-1 files, 
you've violated the disk format.

-Jeff

-- 
Jeff Mahoney
SuSE Labs
