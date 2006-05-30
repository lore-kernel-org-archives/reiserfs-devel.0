From: Arend Freije <afreije@inn.nl>
Subject: Re: RAID-1 and Reiser4 issue: umount hangs
Date: Tue, 30 May 2006 21:20:26 +0200
Message-ID: <447C9AFA.90400@inn.nl>
References: <447B56C1.80608@inn.nl> <200605301553.34815.zam@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------080900030602070004040805"
Return-path: <reiserfs-list-return-28694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200605301553.34815.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--------------080900030602070004040805
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Alexander Zarochentsev wrote:
> Hello,
>
> On Tuesday 30 May 2006 00:17, Arend Freije wrote:
>   
>> Hi,
>>
>> I'm using Reiser4 for my filesystems on disk (/dev/sda) , and it
>> works just fine. Recently I bought a second disk (/dev/sdb) for
>> RAID-1 mirroring. With mdadm I created a degraded raid-1 array  on
>> /dev/md/0, devices missing,/dev/sdb1. After that I created a Reiser4
>> filesystem on /dev/md/0 and mounted it at /mnt. Then I copied the
>> data from /dev/sda1 to /mnt.
>>     
>
> would it work better with "no_write_barrier" mount option?
>   
It would indeed. What's the purpose of this option?

Kind Regards,

Arend

--------------080900030602070004040805
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-15"
 http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Alexander Zarochentsev wrote:
<blockquote cite="mid200605301553.34815.zam@namesys.com" type="cite">
  <pre wrap="">Hello,

On Tuesday 30 May 2006 00:17, Arend Freije wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi,

I'm using Reiser4 for my filesystems on disk (/dev/sda) , and it
works just fine. Recently I bought a second disk (/dev/sdb) for
RAID-1 mirroring. With mdadm I created a degraded raid-1 array  on
/dev/md/0, devices missing,/dev/sdb1. After that I created a Reiser4
filesystem on /dev/md/0 and mounted it at /mnt. Then I copied the
data from /dev/sda1 to /mnt.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
would it work better with "no_write_barrier" mount option?
  </pre>
</blockquote>
It would indeed. What's the purpose of this option?<br>
<br>
Kind Regards,<br>
<br>
Arend<br>
</body>
</html>

--------------080900030602070004040805--
