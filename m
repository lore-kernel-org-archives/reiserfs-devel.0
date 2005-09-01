From: Lexington Luthor <lexington.luthor@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 14:13:43 +0100
Message-ID: <df6uqb$bkf$1@sea.gmane.org>
References: <20050901134604.31ddd297@SiRiUS.home>	<20050901144842.34629bcf@SiRiUS.home>	<4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050901150507.3d6f53c7@SiRiUS.home>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Thomas Kuther wrote:
> Ah OK, that computes. So i'll go with reiserfs on that big one (11 GB
> for internal stuff is too much i have to admit).
> 
> Thanks!
> Tom

Other filesystems will also consume space (most of them, more so than 
reiserfs or reiser4), they will just allocate it incrementally with the 
data. The metadata handling in reiser4 is designed differently, so it 
allocated during mkfs.

Ext3 will use more space than reiser4 for the same data. reiserfs with 
tail packing will use the least space (of all the filesystems in linux), 
but will be slower than reiser4.

I would suggest reiser4 if speed is important, or XFS if data safety is 
important (since r4 is still experimental). Both of them will use around 
5-8% of the disk (depending on the number of files etc.), which is less 
than most filesystems.

LL

