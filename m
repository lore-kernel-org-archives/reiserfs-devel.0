From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Sat, 05 Jul 2003 22:22:08 -0400
Message-ID: <pan.2003.07.05.22.22.07.640423.16446@umail.hungrycats.org>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <200307032210.03901.vitaly@namesys.com> <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 03 Jul 2003 17:18:23 -0400, Zygo Blaxell wrote:

> On Thu, 03 Jul 2003 14:10:03 -0400, Vitaly Fertman wrote:
>> could you run
>>     debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
>> and make it available for downloading.
> 
> That command will take a while...based on the current rate, it will
> finish sometime in the morning on Tuesday, or maybe Monday night.

The good news is that debugreiserfs suddenly started running a lot faster
after I left it, and it finished in a few hours.  The .bz2 file is about
250 megabytes.

The bad news is I don't have permission to send it to anyone.  Further bad
news is that I have to put the array back online ASAP, which means
reformatting the disks.

I get to keep the xxx.bz2 file, so I might be able to continue trying to
understand why reiserfsck is failing on it.
