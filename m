From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 12:11:16 -0800
Message-ID: <41D460E4.6090501@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <20041230170936.GB23354@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041230170936.GB23354@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: Yiannis Mavroukakis <yiannis@jaguarfreight.com>, reiserfs-list@namesys.com

pcg( Marc)@goof(A.).(Lehmann )com wrote:

>
> which also doesn't cope with millions of files
>in a dir, as opposed to the original claims by it's developers).
>  
>
The generation number thing just isn't as good as teaching the tree to 
cope with duplicate keys.  Kudos to Nikita on that one.

>  
>

