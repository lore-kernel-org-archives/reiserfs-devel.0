From: "Vitaly Fertman" <vitaly@namesys.com>
Subject: Re: corruption?  how do I fix?
Date: Thu, 14 Nov 2002 00:41:45 +0300
Message-ID: <002d01c28b5d$7e5f7640$bf7b55c2@figwam>
References: <3DD1DEEF.6030903@panix.com> <3DD2304E.70500@namesys.com> <3DD2698E.50100@panix.com> <3DD26A74.3090800@namesys.com> <3DD26C61.6000103@panix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Transfer-Encoding: 7bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kenny gorman <kgorman@panix.com>, reiserfs-list@namesys.com

Hi,

> >> I am running a semi-large oracle database on reiserfs and lvm.  I
> >> started receiving block corruption messages in oracle.  So I started

Do you mean I/O error messages? reiserfsck does not check partitions
for badblocks so I would suggest you to run /sbin/badblocks utility first.
If you have badblocks on your device, it is a bad idea to continue using
your harddrive, you probably should get a working one.

> Yury,
>
> Thx for the quick response.  Is there a way to 'see' if the
> reiserfsck --fix-fixable .... command would work?  like a dry run?

No, there is no a such.

> Running another backup is going to take a while, so I need to gauge the
> risks.  What is this command going to do?  Is it permanent when I do it
> (seems like it from the docs)
>

If you do not have badblocks, then the only problem is bitmaps. reiserfsck
--fix-fixable should fix it easily - it is not a severe corruption and the
latest reiserfsck is considered as quite stable.

Thanks,
Vitaly Fertman







