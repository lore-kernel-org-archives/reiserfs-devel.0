From: Spam <spam@tnonline.net>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 15:19:04 +0200
Message-ID: <216013485.20040816151904@tnonline.net>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
 <1092660765.28417.4.camel@leto.cs.pocnet.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20326-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092660765.28417.4.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



> Am Sonntag, den 15.08.2004, 23:16 +0200 schrieb Felix E. Klee:

>> I'd like to store the directory structure of a partition formatted as
>> ReiserFS into a file. Currently, I use
>> 
>>     find / >file
>> 
>> This process takes approximately 5 minutes (the result is 26MB of
>> data). Are there any alternative *quicker* ways to do this?

> The main problem is that find only uses one thread. This thread only
> reads one directory at once and as a result of that you'll get a lot of
> seeks.

  I am confused about this in general with most filesystems. I thought
  that all filenames/foldernames etc were stored in one place and not
  spread out over the intire filesystem.

  It seem to me very strange that things like find/ls -R etc takes so
  so long just read/list files like this on any modern filesystem.

> This can usually be improved *a lot* by doing a massively multi-threaded
> search with a lot of threads trying to read a lot of directories at
> once. The disk io scheduler will then linearize all the outstanding read
> requests.

> I've done something similar to speed up a diff -r using a shell script
> (not for find but for reading the file content that should be compared).





