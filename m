From: Christian Kujau <christian@g-house.de>
Subject: Re: Filesystem corruption
Date: Mon, 28 May 2007 18:31:05 +0100 (BST)
Message-ID: <Pine.LNX.4.64.0705281829510.6275@sheep.housecafe.de>
References: <46598532.5060505@lncsa.com> <Pine.LNX.4.64.0705280025570.10429@sheep.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.64.0705280025570.10429@sheep.housecafe.de>
Sender: "evil@g-house.de"@mail.g-house.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-list@namesys.com

[resending, because lncsa.com bounced my mail]

On Mon, 28 May 2007, Christian Kujau wrote:
> On Sun, 27 May 2007, Laurent CARON wrote:
>> The entry that scares me is
>> ?---------   ? ?      ?            ?                ? new
>> 
>> Seems to me it is a filesystem corruption.
>> Any other solution than rebuild-tree ?
>
> Please try to check the fs with a current version of reiserfsprogs first. As 
> the manpage advises, try --check first and use --rebuild-tree only if you 
> know what you're doing, IOW: have a current backup.
>
> Also, which kernel/machine is this running on? Do you know *why* this 
> corruption may have occured? Any recent hardware issues? Is ther anything in 
> the logs regarding fs/device errors?
>
> C.
> -- 
> BOFH excuse #448:
>
> vi needs to be upgraded to vii
