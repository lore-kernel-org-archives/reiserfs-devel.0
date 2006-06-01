From: Arend Freije <afreije@inn.nl>
Subject: Re: RAID-1 and Reiser4 issue: umount hangs
Date: Thu, 01 Jun 2006 07:54:33 +0200
Message-ID: <447E8119.4080308@inn.nl>
References: <4478CF33.80609@inn.nl> <17528.55008.287088.705263@cse.unsw.edu.au> <44797136.4050707@inn.nl> <17530.14115.195147.46212@cse.unsw.edu.au> <447D5F7C.8020401@inn.nl> <20060531093644.GL29535@suse.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010405050809080308020701"
Return-path: <reiserfs-list-return-28712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060531093644.GL29535@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jens Axboe <axboe@suse.de>, Alexander Zarochentsev <zam@namesys.com>
Cc: Neil Brown <neilb@suse.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--------------010405050809080308020701
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jens Axboe wrote:
> On Wed, May 31 2006, Arend Freije wrote:
>   
>> You're probably right. I found several posts on the linux-kernel list
>> involving problems with write barrier support in combination with SATA
>> and ext3 . So I tried:
>>
>> # mkfs -t ext3 /dev/md/0
>> # mount -o barrier=1 /dev/md/0 /mnt
>> # cp -a $src /mnt
>> # umount /mnt
>>
>> And indeed, umount hangs now as well.
>> So it seems to be a linux-kernel issue after all...
>>     
>
> Can you please try 2.6.17-rc5?
>
>   

Great! 2.6.17_rc5 fixed this is issue. For Reiser4 as well as Ext3 (with
barrier=1).

Many Thanks!

Arend

--------------010405050809080308020701
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Jens Axboe wrote:
<blockquote cite="mid20060531093644.GL29535@suse.de" type="cite">
  <pre wrap="">On Wed, May 31 2006, Arend Freije wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">You're probably right. I found several posts on the linux-kernel list
involving problems with write barrier support in combination with SATA
and ext3 . So I tried:

# mkfs -t ext3 /dev/md/0
# mount -o barrier=1 /dev/md/0 /mnt
# cp -a $src /mnt
# umount /mnt

And indeed, umount hangs now as well.
So it seems to be a linux-kernel issue after all...
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Can you please try 2.6.17-rc5?

  </pre>
</blockquote>
<br>
Great! 2.6.17_rc5 fixed this is issue. For Reiser4 as well as Ext3
(with barrier=1).<br>
<br>
Many Thanks!<br>
<br>
Arend<br>
</body>
</html>

--------------010405050809080308020701--
