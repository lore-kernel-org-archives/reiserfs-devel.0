From: Hans Reiser <reiser@namesys.com>
Subject: Re: xattr
Date: Tue, 17 Jun 2003 15:04:48 +0400
Message-ID: <3EEEF5D0.6050705@namesys.com>
References: <200306162226.39701.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306162226.39701.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com, Alexander Lyamin <flx@namesys.com>

Russell Coker wrote:

>What is the status of xattr support in 2.5.x?
>
Please read www.namesys.com/v4/v4.html.  I will be happy to add support 
for desired security attributes using the V4 plugin infrastructure, and 
especially pleased to accept patches that do so.  It is trivially easy 
to compose plugins that commit atomically, and most of them do so by 
default.

I note that we are not listed in spamcop, and thank you for that.  Our 
itanium is now installed, and work has started on moving our mail+web 
server to new hardware and OS version.  When that is complete, the 
mailing list software will be given to a kind volunteer to de-spam.

>
>How is journalling of xattr's being handled?
>
>For correct operation of SE Linux we need to have the xattr that is used for 
>the security context be changed atomically, and if a file is created and 
>immediately has the xattr set then ideally we would have the file creation 
>and the xattr creation in the same journal entry.
>
>Is this possible?  If doing this requires that the file system be mounted with 
>data=journal then this will be fine.
>
>  
>

Namesys generally avoids disturbing the stability of V3 with new 
features.  V4 is coming out this summer, and it is better to focus 
developers on V4.  This is not a categorical rejection, just a gut first 
reaction.

-- 
Hans


