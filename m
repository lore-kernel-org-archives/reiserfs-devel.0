From: Hans Reiser <reiser@namesys.com>
Subject: Re: Filesystem Corruption Problems
Date: Wed, 07 May 2003 21:40:22 +0400
Message-ID: <3EB94506.8020106@namesys.com>
References: <NHBBIGLOALLFLCNJNOLHGELNCAAA.bill@billrees.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NHBBIGLOALLFLCNJNOLHGELNCAAA.bill@billrees.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bill Rees <bill@billrees.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Vitaly Fertman <vitaly@namesys.com>, vs@namesys.com

Bill Rees wrote:

>Hello,
>
>I have an application that uses multiple drives formatted with reiserfs to
>store many thousands of JPEG images for later retrieval. These images are
>coming from one or more cameras in the form of a streaming MJPEG. My
>application essentially writes images to one or more drives as fast as it
>can. When a set number of hours of storage is reached for a particular
>camera, the program begins deleting old images. Depending on the framerate
>of image capture, the contents of the disk could be rewritten entirely in
>the process of just a few days.
>
>When this application is left running for an extended period of time, severe
>disk corruption usually crops up. Usually, there are media errors in the
>kernel log from the reiser file system indicating something very bad is
>occuring. I have tried recovering from this with reiserfsck but the only
>solution is usually a reformat. Sometimes the corruption does not allow the
>deletion of any files from the drive and sometimes it causes a kernel panic
>whenever the disk is accessed. I am using version 2.4.19 of the kernel
>without any patches. The application is written in Java and runs under JDK
>v1.4.1.
>
>Is this a known issue? I realize that the creation and deletion of thousands
>of files per day creates problems that might not be seen on the typical file
>server. Any info would be appreciated.
>
>Bill
>
>
>
>  
>
This is not a known issue.  Vladimir and Vitaly will work with you on 
trying to debug and reproduce it.

-- 
Hans


