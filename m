From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Identical files in reiser4 patch for linux-2.6.16-rc1-mm3
Date: Fri, 10 Feb 2006 11:42:24 +0300
Message-ID: <1139560944.6292.19.camel@tribesman.namesys.com>
References: <43EB9C4A.3080208@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43EB9C4A.3080208@aon.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Klotz <peter.klotz@aon.at>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-02-09 at 20:47 +0100, Peter Klotz wrote:
> In linux-2.6.16-rc1-mm3 one finds the identical files 
> reiser4/plugin/item/sde.h and reiser4/plugin/item/acl.h.
> 
> Even their sentries are identical. Was that intended?
> 
no, reiser4/plugin/item/acl.h has to be deleted.
Thanks

> Best regards, Peter.
> 

