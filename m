From: Clifford Beshers <clifford.beshers@lindows.com>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 16:22:56 -0700
Message-ID: <40A2B1D0.5040005@lindows.com>
References: <409AC2FF.7080800@lindows.com> <1083917932.14089.281.camel@tribesman.namesys.com> <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com> <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com> <20040512034150.GS9641@schnapps.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------080500060606080605000103"
Return-path: <reiserfs-list-return-18637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040512034150.GS9641@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

--------------080500060606080605000103
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Andreas Dilger wrote:

>>   * Is there a tool to determine the type of file system on a
>>     partition without mounting it?
>>    
>>
>
>Lots of them.  "file -s /dev/foo" or if you have a newer e2fsprogs (1.33
>and newer I think) you can use "blkid [dev ...]" to tell you a bunch of
>things about each device (LABEL, UUID, TYPE).
>
>
>  
>
Very interesting.  Unfotunately, my results don't match yours.

First, I had tried 'file' and found that it didn't work.  I tried it 
again and found that it still didn't work.

    root@notsomarlin:~# losetup /dev/loop/0 /tmp/foo
    root@notsomarlin:~# mke2fs /dev/loop/0
    ...
    root@notsomarlin:~# file /tmp/foo
    /tmp/foo: Linux rev 1.0 ext2 filesystem data
    root@notsomarlin:~# mkreiserfs /dev/loop/0
    ...
    ReiserFS is successfully created on /dev/loop/0.
    root@notsomarlin:~# file /tmp/foo
    /tmp/foo: data

Do you get other results?  If not, it would seem that Debian's version 
of 'file' is broken, yet I checked the source code and there are magic 
numbers for reiserfs included.

Also, I check e2fsprogs and it is at version 1.35 in Debian unstable, 
but no tool called 'blkid' is included.

So I'm still searching for reliable methods to do this.

--------------080500060606080605000103
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
Andreas Dilger wrote:<br>
<blockquote type="cite"
 cite="mid20040512034150.GS9641@schnapps.adilger.int">
  <blockquote type="cite">
    <pre wrap="">   * Is there a tool to determine the type of file system on a
     partition without mounting it?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Lots of them.  "file -s /dev/foo" or if you have a newer e2fsprogs (1.33
and newer I think) you can use "blkid [dev ...]" to tell you a bunch of
things about each device (LABEL, UUID, TYPE).


  </pre>
</blockquote>
Very interesting.&nbsp; Unfotunately, my results don't match yours.<br>
<br>
First, I had tried 'file' and found that it didn't work.&nbsp; I tried it
again and found that it still didn't work.<br>
<blockquote>root@notsomarlin:~# losetup /dev/loop/0 /tmp/foo<br>
root@notsomarlin:~# mke2fs /dev/loop/0<br>
...<br>
root@notsomarlin:~# file /tmp/foo<br>
/tmp/foo: Linux rev 1.0 ext2 filesystem data<br>
root@notsomarlin:~# mkreiserfs /dev/loop/0<br>
...<br>
ReiserFS is successfully created on /dev/loop/0.<br>
root@notsomarlin:~# file /tmp/foo<br>
/tmp/foo: data<br>
</blockquote>
Do you get other results?&nbsp; If not, it would seem that Debian's version
of 'file' is broken, yet I checked the source code and there are magic
numbers for reiserfs included.<br>
<br>
Also, I check e2fsprogs and it is at version 1.35 in Debian unstable,
but no tool called 'blkid' is included.<br>
<br>
So I'm still searching for reliable methods to do this.<br>
</body>
</html>

--------------080500060606080605000103--

