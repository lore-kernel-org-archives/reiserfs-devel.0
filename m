From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS post-crash issues
Date: Tue, 21 Sep 2004 08:01:19 -0700
Message-ID: <4150423F.3020804@namesys.com>
References: <e96ff120040921013254b63c93@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e96ff120040921013254b63c93@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ash <ashrat@gmail.com>
Cc: reiserfs-list@namesys.com

FS operations are not persistent unless you fsync or wait long enough. 
That is the expected norm for unix fs design.

Hans

Ash wrote:

>Hi
>
>I have been running a few tests on ReiserFS to check durability of
>common filesystem operations.
>For example, create a certain number of files and crash the machine
>(poweroff) immediately after this.
>On rebooting, check the number of files actually present on the
>filesystem after log replay.
>
>Similarly, I tried for some other operations like rename, link and delete.
>I am using a C program with open, rename and link system calls to
>perform these operations respectively
>and crashing the system using a network power switch immediately after
>my C program finishes doing its stuff.
>So the delay in-between completion of the operations and the machine crashing
>should be, according to me, less than 1-2 seconds (which is the time
>required to establish a telnet connection to the power switch)
>
>It seems that ReiserFS operations are not durable for most of the cases I tried.
>
>For file create, when tried with 50K, 100K and 1M files, I got
>34224, 99492, and 998594 files respectively after system rebooted from the
>crash. Similarly for operations like rename and link, the number of files
>renamed or linked after reboot is less than what the filesystem reports prior
>to the crash.
>
>Now introducing a fsync() after every open() call does solve the problem
>but the performance degradation seen is very high. In fact, I did notice
>the related discussion on the FAQ at namesys.com.
>
>Also, operations like rename, link and delete also seem to give problems.
>
>However, with other filesystems like XFS, I get much better results (almost
>100% durability) on similar tests.
>
>I am using ReiserFS with linux kernel 2.6.7
>
>Any comments/suggestions will be helpful.
>
>Thanks,
>Ash
>
>
>  
>

