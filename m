From: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Mon, 03 Jul 2006 11:03:16 +0900
Message-ID: <6.0.0.20.2.20060703104306.0410e330@172.19.0.2>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <200606300824.12352.mason@suse.com>
 <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
 <200607011534.24157.mason@suse.com>
 <44A7E790.3050003@namesys.com>
 <6.0.0.20.2.20060703095844.04122500@172.19.0.2>
 <20060702183652.9612309b.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20060702183652.9612309b.akpm@osdl.org>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <200606300824.12352.mason@suse.com>
 <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
 <200607011534.24157.mason@suse.com>
 <44A7E790.3050003@namesys.com>
 <6.0.0.20.2.20060703095844.04122500@172.19.0.2>
 <20060702183652.9612309b.akpm@osdl.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org, reiser@namesys.com, mason@suse.com


 >How can i_size be increased without adding blocks?  Are you referring to a
 >write which remains wholly within the final block of the file?

Yes, It is a case when a file extends within the final block.

 >
 >And what are the user-visible consequences of this bug?

Because the i_size is not written to the FS through fsync(),
an user can not see the whole content of a file when filesystem
crashes just after fsync() call.

thanks. 

