From: Spam <spam@tnonline.net>
Subject: Re: Reiser4 kernel modules
Date: Sat, 6 Nov 2004 20:14:09 +0100
Message-ID: <1086151816.20041106201409@tnonline.net>
References: <1099299984.1712.82.camel@tribesman.namesys.com>
 <20041106190029.16253.qmail@web52807.mail.yahoo.com>
 <111731953.20041106200749@tnonline.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <111731953.20041106200749@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Shawn Rutledge <e_cloud@yahoo.com>, Reiser4 <reiserfs-list@namesys.com>


 =20



>> --- Vladimir Saveliev <vs@namesys.com> wrote:
>>> reiser4 needs some changes in kernel code.
>>> ftp://ftp.namesys.com/pub/reiser4-for-2.6.9 contains all things which
>>> are necessary to run reiser4 on 2.6.9

>> Right now I go there and find only two files:

>> ncftp /pub/reiser4-for-2.6.9 > ls -al
>> -rw-r--r--    1 0        0               0 Nov  2 18:40
>> reiser4-for-2.6.9-TEMPORARY_NOT_AVAILABLE
>> -rw-r--r--    1 0        0             454 Nov  2 15:24
>> reiser4-on-2.6.9-HOWTO

>> I also tried downloading the (huge) 2.6.9-mm patch from ftp.kernel.org.
>>  After I had applied it, to a vanilla 2.6.9 source tree, I couldn't
>> find Reiser4 anywhere under filesystems when doing a make config.

>  You need to DISABLE 8K stacks for the option of Reiser4 to be
>  visible.

  Ehum. I am a little tired. I meant disable 4K stacks :)

>>  I
>> built it anyway with ReiserFS enabled, in case you didn't make it a
>> separate option but just merged it into the existing option, but I
>> cannot mount a Reiser4 partition.  So where should I expect to find
>> Reiser4 in the config menus?


>   ~S
=B4

--=20

