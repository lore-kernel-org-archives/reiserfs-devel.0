From: Anders Widman <andewid@tnonline.net>
Subject: Re: ReiserFS and NFS?
Date: Wed, 4 Sep 2002 23:23:07 +0200
Message-ID: <18158747625.20020904232307@tnonline.net>
References: <18030661062.20020903175652@tnonline.net>
 <20020904101012.A10223@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020904101012.A10223@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello!

> On Tue, Sep 03, 2002 at 05:56:52PM +0200, Anders Widman wrote:
>> 
>>    I am trying to use ReiserFS with NFS to work nicely, but I ran into
>>    troubles  exporting root (/). I am getting the following error when
>>    a   client   tries  to  connect  to  the  root  export  (I am using
>>    ReiserFS on root filesystem):
>>       rpc.mountd: getfh failed: Operation not permitted
>>    After  browsing around different mailing lists and read suggestions
>>    about Kernel and NFS utils I found that someone said that there was
>>    needed patches to use ReiserFS with NFS?

> Hmmm.
> What kernel are you using? What nfs server?

Using 2.4.19 with nfsd running.

> 2.4.19 with stock knfsd:
> angband:~ # cat /etc/exports
> / (ro)

> bowl:~# mount angband:/ /mnt/testfs -t nfs
> bowl:~# ls /mnt/testfs/
> .   bin   cdrecorder  dev  floppy  lib    mnt  proc    root  testfs0  tmp  var
> ..  boot  cdrom       etc  home    media  opt  rescue  sbin  testfs1  usr

> Changing config:
> angband:~ # cat /etc/exports
> / (rw,no_root_squash,insecure)
> angband:~ # exportfs -a
> exportfs: No host name given with / (rw,no_root_squash,insecure), suggest *(rw,no_root_squash,insecure) to avoid warning

> bowl:~# ls /mnt/testfs/
> .    boot        dev     home   mnt   rescue  testfile  tmp
> ..   cdrecorder  etc     lib    opt   root    testfs0   usr
> bin  cdrom       floppy  media  proc  sbin    testfs1   var

> Everything works ok.

> But now (/rescue is another mount point):
> bowl:~# mount angband:/rescue /mnt/testfs -t nfs

> Sep  4 10:06:17 angband rpc.mountd: authenticated mount request from 212.16.7.82:916 for /rescue (/)
> Sep  4 10:06:17 angband rpc.mountd: getfh failed: Operation not permitted

>>    Right now my exports file looks like this:
>>          /usr/src/       192.168.0.100(rw,no_root_squash,insecure)
>>          /               192.168.0.100(rw,no_root_squash,insecure)

>>    Is this something someone might know how to fix?

> What if you allow anyone to connect (use * instead of address?)
> Look into logs on on nfs server side for more clues, enable debug.

I  don't think I tried using only a '*' instead of an address. Will do
that.

> Basically I do not think yo are experiencing reiserfs problem, but it rather
> looks like nfs server configuration problem.

I  was out of clues, therefore I posted here as there was someone that
mentioned ReiserFS and NFS problems somewhere.

> I hope you have not forgot to to 'exportfs -a' after changing /etc/exports.

Of course not =).. And I tried rebooting too.

Anyway, thanks for your response!

Regards,
Anders

> Bye,
>     Oleg

