From: Hans Reiser <reiser@namesys.com>
Subject: Re: Atomicity with reiser4?
Date: Thu, 03 Feb 2005 12:01:27 -0800
Message-ID: <42028317.4040301@namesys.com>
References: <CMEFJOIJPCAMFCEKIEOECEPFCFAA.smallwood@maya.com> <1107422037.3204.55.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107422037.3204.55.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Nicolas Smallwood <smallwood@maya.com>, reiser <reiserfs-list@namesys.com>

I think it is essential that you use the atomic transactions 
functionality to get good performance on top of reiser4 for what you are 
doing.  Unfortunately, that API is still kernel internal at this time, 
and we have not yet coded the export of it to outside the kernel. We 
will though, we just need some time.

Hans
